#######################################################################
##### Simulation code to test the sample size procedure for IRGT ######
#######################################################################

#Data generating process
datagen_irgt<-function(eff=0.25, rhoy1, rhoy0, m1, m0, n1, n0){
  #Fixed parameters
  alpha = 0.05  #type-1 error
  beta = 0.20   #type-2 errpr
  #p=p           #rough treatment proportion
  vary1 = 1     #variance of Y condition on X in 1st arm
  vary0 = 2     #variance of Y condition on X in 2nd arm
  varx =  1     #continuous covariate variance/mean is zero
  
  b1=0          #intercept
  b2=1.0       #treatment effect
  b3=0.5        #covariate effect
  b4=eff        #interaction effect to be powered
  
  #total sample size
  N1 <- n1*m1
  N0 <- n0*m0
  N=N1+N0
  
  #generate id
  pid <- seq(1:N)
  
  # Generate continuous covariate from normal
  X<-rnorm(N,0,sqrt(varx))
  
  #randomize treatment assignment
  W<-rep(0, N)
  W[sample(1:N, size=N1)] <- 1
  
  #cluster id
  cluster<-rep(NA,N)
  cluster[which(W==1)]<-rep(1:n1,each=m1)
  cluster[which(W==0)]<-rep((n1+1):(n1+n0),each=m0)
  
  #random-effect and residual variance
  sigmac1 <- sqrt(rhoy1*vary1)  #cluster level sd; sigma= vary
  sigmae1 <- sqrt((1-rhoy1)*vary1)  # individual level sd
  sigmac0 <- sqrt(rhoy0*vary0)  #cluster level sd; sigma= vary
  sigmae0 <- sqrt((1-rhoy0)*vary0)  # individual level sd
  
  #residual effect
  rsd<-rep(NA,N)
  rsd[which(W==1)]<-rnorm(n1*m1,0,sigmae1)
  rsd[which(W==0)]<-rnorm(n0*m0,0,sigmae0)
  
  #random effects
  re<-rep(NA,N)
  re[which(W==1)]<-rep(rnorm(n1,0,sigmac1),each=m1)
  re[which(W==0)]<-rep(rnorm(n0,0,sigmac0),each=m0)
  
  # with positive interaction  
  Y <- b1+b2*W+b3*X+b4*X*W+rsd+re
  # with null interaction
  Y0 <- b1+b2*W+b3*X+rsd+re
  
  df <- data.frame(pid, cluster, W, X, Y, Y0)
  
  return(df)
}

#test code
#df<-datagen_irgt(eff=0.25, rhoy1=0.05, rhoy0=0.00, m1=10, m0=1, n1=50, n0=20)


#simulation code for irgt 
sim_irgt<-function(eff, rhoy1, rhoy0, varx, vary1, vary0, m1, m0, p=0.5,nsim=1000){
  
  #Fixed parameters
  #alpha = 0.05  #type-1 error
  #beta = 0.20   #type-2 error
  #p = p       #treatment proportion
  
  ss_irgt<-sample_size_irgt(eff=eff, rhoy1=rhoy1, rhoy0=rhoy0, varx=varx, vary1=vary1, vary0=vary0, m1=m1, m0=m0, p=p)
  
  
  #Store results
  output0=array(NA,dim=c(4,5,nsim))
  output1=array(NA,dim=c(4,5,nsim))
  n1=ss_irgt[1]
  n0=ss_irgt[2]
  require("nlme")
  
  for (s in 1:nsim){
    #Generate data
    df<-datagen_irgt(eff=eff, rhoy1=rhoy1, rhoy0=rhoy0, m1=m1, m0=m0, n1=n1, n0=n0)
    
    if (m0>1){
      #Fit model
      fit0<-try(lme(Y0 ~ W*X, random = list( cluster = pdDiag(~W)),weights = varIdent(form= ~ 1 | W), data=df),silent=T)
      if(class(fit0)=="try-error"){ s<- s-1; break}
      output0[,,s]<-summary(fit0)$tTable
      
      fit1<-try(lme(Y ~ W*X, random = list( cluster = pdDiag(~W)),weights = varIdent(form= ~ 1 | W), data=df),silent=T)
      if(class(fit1)=="try-error"){ s<- s-1; break}
      output1[,,s]<-summary(fit1)$tTable
    }else{
      #Fit model
      fit0<-try(lme(Y0 ~ W*X, random = list( cluster = pdDiag(~0+W),
                                             pid = pdDiag(~1)), weights = varIdent(form= ~ 1 | W), data=df),silent=T)
      if(class(fit0)=="try-error"){ s<- s-1; break}
      output0[,,s]<-summary(fit0)$tTable
      
      fit1<-try(lme(Y ~ W*X, random = list( cluster = pdDiag(~0+W),
                                            pid = pdDiag(~1)) ,weights = varIdent(form= ~ 1 | W), data=df),silent=T)
      if(class(fit1)=="try-error"){ s<- s-1; break}
      output1[,,s]<-summary(fit1)$tTable
    }
  }  
  
  tp1<-round(mean(output0[4,5,]<0.05,na.rm=T) , 3)
  empower<-round(mean(output1[4,5,]<0.05,na.rm=T) , 3)
  
  print(c(m1, m0, rhoy1, rhoy0, n1, n0, ss_irgt[7], tp1, empower))
  return(data.frame("sample_size1"=ss_irgt[1], "sample_size0"=ss_irgt[2],
                    "mean_cluster_size1"=m1, "mean_cluster_size0"=m0, 
                    "total_individual1"=ss_irgt[4], "total_individual0"=ss_irgt[5], "true_power"=round(ss_irgt[7]*100,1),
                    "type1_error"=round(tp1*100,1), "em_power"=round(empower*100,1)))
}

#test code
#trial1<-sim(eff=0.25, rhoy1=0.01, rhoy0=0.05, varx=1, vary1=2, vary0=1, m1=5, m0=10, p=0.5,nsim=100)



##################################################################
##### Functions to calculate power and sample size for CRT ######
##################################################################

#Power calculation for CRT
power_crt<- function(eff, rhoy1, rhoy0, rhox, varx, vary1, vary0, m1, m0, n1, n0){
  alpha=0.05
  p1=n1/(n1+n0)
  p0=1-p1
  sigma2<-vary1*(1-rhoy1)*(1+(m1-1)*rhoy1)/(varx*p1*m1*(1+(m1-2)*rhoy1-(m1-1)*rhox*rhoy1))+
    vary0*(1-rhoy0)*(1+(m0-1)*rhoy0)/(varx*p0*m0*(1+(m0-2)*rhoy0-(m0-1)*rhox*rhoy0))
  
  power<-pnorm(sqrt((n1+n0)*eff^2/sigma2)-qnorm(1-alpha/2))
  return (power)
}

#Sample size calculation for IRGT
sample_size_crt<- function(eff, rhoy1, rhoy0, rhox, varx, vary1, vary0, m1, m0, p=0.5, equal=TRUE){ 
  # p will be a design parameter that says roughly half half split
  beta=0.2
  alpha=0.05
  #optimal sample size allocation
  #p1<-(1+sqrt((vary0*m1*(1-rhoy0)*(1+(m0-1)*rhoy0)*(1+(m1-2)*rhoy1))/(vary1*m0*(1-rhoy1)*(1+(m1-1)*rhoy1)*(1+(m0-2)*rhoy0))))^(-1)
  
  p1=(1-p)*m0/(p*m1+(1-p)*m0)
  p0=1-p1
  
  sigma2<-vary1*(1-rhoy1)*(1+(m1-1)*rhoy1)/(varx*p1*m1*(1+(m1-2)*rhoy1-(m1-1)*rhox*rhoy1))+
    vary0*(1-rhoy0)*(1+(m0-1)*rhoy0)/(varx*p0*m0*(1+(m0-2)*rhoy0-(m0-1)*rhox*rhoy0))
  
  n = (qnorm(1-alpha/2) + qnorm(1-beta))^2/(eff^2)*sigma2
  n1 = n*p1 
  n0 = n*p0
  
  nx<-c(ceiling(n1),floor(n0))
  ny<-c(floor(n1),ceiling(n0))
  nz<-c(ceiling(n1),ceiling(n0))
  
  pwx<-power_crt(eff=eff, rhoy1=rhoy1, rhoy0=rhoy0, rhox=rhox, varx=varx, vary1=vary1, vary0=vary0, m1=m1, m0=m0, n1=nx[1], n0=nx[2])
  pwy<-power_crt(eff=eff, rhoy1=rhoy1, rhoy0=rhoy0, rhox=rhox, varx=varx, vary1=vary1, vary0=vary0, m1=m1, m0=m0, n1=ny[1], n0=ny[2])
  pwz<-power_crt(eff=eff, rhoy1=rhoy1, rhoy0=rhoy0, rhox=rhox, varx=varx, vary1=vary1, vary0=vary0, m1=m1, m0=m0, n1=nz[1], n0=nz[2])
  
  if (pwx<0.8 & pwy<0.8) {
    n1=nz[1]
    n0=nz[2]
    emp=pwz
  }
  
  if (pwx>0.8 & pwy<0.8){
    n1=nx[1]
    n0=nx[2]
    emp=pwx
  }
  
  if (pwx<0.8 & pwy>0.8){
    n1=ny[1]
    n0=ny[2]
    emp=pwy
  }
  
  if (pwx>0.8 & pwy>0.8){
    if (pwx<pwy){
      n1=nx[1]
      n0=nx[2]
      emp=pwx
    }else{
      n1=ny[1]
      n0=ny[2]
      emp=pwy
    }
  }
  
  if (equal==T){
    #force equal cluster
    if (n1!=n0){
      n=max(c(n1,n0))
      n1=n0=n
      emp=power_crt(eff=eff, rhoy1=rhoy1, rhoy0=rhoy0, rhox=rhox, varx=varx, vary1=vary1, vary0=vary0, m1=m1, m0=m0, n1=n1, n0=n0)
    }
  }
  n10=n1+n0
  N1 = n1*m1
  N0 = n0*m0
  N10=N1+N0
  
  return (c(n1,n0, n10, N1, N0, N10, emp))
}

#test code
#sample_size_crt(eff=0.35, rhoy1=0.01, rhoy0=0.05, rhox=0.25,varx=1, vary1=1, vary0=2, m1=5, m0=10, p=0.5)

#Sample size calculation for pre-defined scenarios
ss_crt<-function(eff=0.5,rhox=0.25){
  #eff=0.5
  vary1=1
  vary0=2
  rhoy1<-c(0.01,0.05,0.10)
  rhoy0<-c(0.01,0.05,0.10)
  m1<-c(20,50,100)
  varx=1
  
  S<-length(eff)*length(rhoy1)*length(rhoy0)*length(m1)
  SampleSize<-matrix(NA,S,11)
  colnames(SampleSize)<-c("delta","rhoy1","rhoy0","m1","n1","n0","n10", "N1", "N0", "N10", "emp")
  
  count=1
  for (i0 in 1:length(eff)){
    for (i in 1:length(rhoy1)){
      for (j in 1:length(rhoy0)){
        for (k in 1:length(m1)){
          ss<-sample_size_crt(eff=eff[i0], rhoy1=rhoy1[i], rhoy0=rhoy0[j], rhox=rhox, varx=varx, vary1=vary1, vary0=vary0, m1=m1[k], m0=m1[k], p=0.5)
          SampleSize[count,]<-c(eff[i0],rhoy1[i],rhoy0[j], m1[k],ss[1],ss[2],ss[3],ss[4],ss[5],ss[6],ss[7])
          count=count+1
        }
      }
    }
  }
  return(SampleSize)
}

#ss1<-ss_crt(eff=0.2,rhox=0.01)
#ss2<-ss_crt(eff=0.2,rhox=0.25)
#ss3<-ss_crt(eff=0.2,rhox=0.50)


#######################################################################
##### Simulation code to test the sample size procedure for IRGT ######
#######################################################################

#Data generating process for CRT

datagen_crt<-function(eff=0.25, rhoy1, rhoy0, rhox, m1, m0, n1, n0){
  #Fixed parameters
  alpha = 0.05  #type-1 error
  beta = 0.20   #type-2 errpr
  #p=p           #rough treatment proportion
  vary1 = 1     #variance of Y condition on X in 1st arm
  vary0 = 2     #variance of Y condition on X in 2nd arm
  varx =  1     #continuous covariate variance/mean is zero
  
  b1=0          #intercept
  b2=1.0       #treatment effect
  b3=0.5        #covariate effect
  b4=eff        #interaction effect to be powered
  
  #randomize treatment assignment
  n=n1+n0
  W0<-rep(0, n)
  W0[sample(1:n, size=n1)] <- 1
  cl_size<-W0*m1+(1-W0)*m0
  W<-rep(W0,cl_size)
  
  #cluster id
  cluster<-rep(1:n,cl_size)
  
  #total sample size
  N1 <- n1*m1
  N0 <- n0*m0
  N=N1+N0
  
  #generate id
  pid <- seq(1:N)
  
  # Generate continuous covariate from hierarchical normal
  sigmaxc <- sqrt(rhox*varx) #cluster level sd
  sigmaxe <- sqrt((1-rhox)*varx) # individual level sd
  
  miu<-rep(rnorm(n, 0, sigmaxc), cl_size)
  X <-rnorm(N, 0, sigmaxe)+miu
  #X<-rnorm(N,0,sqrt(varx))
  
  #random-effect and residual variance
  sigmac1 <- sqrt(rhoy1*vary1)  #cluster level sd; sigma= vary
  sigmae1 <- sqrt((1-rhoy1)*vary1)  # individual level sd
  sigmac0 <- sqrt(rhoy0*vary0)  #cluster level sd; sigma= vary
  sigmae0 <- sqrt((1-rhoy0)*vary0)  # individual level sd
  
  #residual effect
  rsd<-rep(NA,N)
  rsd[which(W==1)]<-rnorm(n1*m1,0,sigmae1)
  rsd[which(W==0)]<-rnorm(n0*m0,0,sigmae0)
  
  #random effects
  re<-rep(NA,N)
  re[which(W==1)]<-rep(rnorm(n1,0,sigmac1),each=m1)
  re[which(W==0)]<-rep(rnorm(n0,0,sigmac0),each=m0)
  
  # with positive interaction  
  Y <- b1+b2*W+b3*X+b4*X*W+rsd+re
  # with null interaction
  Y0 <- b1+b2*W+b3*X+rsd+re
  
  df <- data.frame(pid, cluster, W, X, Y, Y0)
  
  return(df)
}

#test code
#df<-datagen_crt(eff=0.25, rhoy1=0.05, rhoy0=0.01, rhox=0.01, m1=10, m0=10, n1=50, n0=20)


#simulation code for CRT
sim_crt<-function(eff, rhoy1, rhoy0, rhox, varx, vary1, vary0, m1, m0, p=0.5, nsim=1000){
  
  ss_crt<-sample_size_crt(eff=eff, rhoy1=rhoy1, rhoy0=rhoy0, rhox=rhox, varx=varx, vary1=vary1, vary0=vary0, m1=m1, m0=m0, p=p)
  
  #Store results
  output0=array(NA,dim=c(4,5,nsim))
  output1=array(NA,dim=c(4,5,nsim))
  n1=ss_crt[1]
  n0=ss_crt[2]
  require("nlme")
  
  for (s in 1:nsim){
    #Generate data
    df<-datagen_crt(eff=eff, rhoy1=rhoy1, rhoy0=rhoy0, rhox=rhox, m1=m1, m0=m0, n1=n1, n0=n0)
    
    #Fit model
    fit0<-try(lme(Y0 ~ W*X, random = list( cluster = pdDiag(~W)),weights = varIdent(form= ~ 1 | W), data=df),silent=T)
    if(class(fit0)=="try-error"){ s<- s-1; break}
    output0[,,s]<-summary(fit0)$tTable
    
    fit1<-try(lme(Y ~ W*X, random = list( cluster = pdDiag(~W)),weights = varIdent(form= ~ 1 | W), data=df),silent=T)
    if(class(fit1)=="try-error"){ s<- s-1; break}
    output1[,,s]<-summary(fit1)$tTable
  }  
  
  tp1<-round(mean(output0[4,5,]<0.05,na.rm=T) , 3)
  empower<-round(mean(output1[4,5,]<0.05,na.rm=T) , 3)
  
  print(c(m1, m0, rhox, rhoy1, rhoy0, n1, n0, ss_crt[7], tp1, empower))
  return(data.frame("sample_size1"=ss_crt[1], "sample_size0"=ss_crt[2],
                    "mean_cluster_size1"=m1, "mean_cluster_size0"=m0, 
                    "total_individual1"=ss_crt[4], "total_individual0"=ss_crt[5], "true_power"=round(ss_crt[7]*100,1),
                    "type1_error"=round(tp1*100,1), "em_power"=round(empower*100,1)))
}


