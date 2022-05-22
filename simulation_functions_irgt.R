
##################################################################
##### Functions to calculate power and sample size for IRGT ######
##################################################################

#Power calculation for IRGT HTE
power_irgt<- function(eff, rhoy1, rhoy0, varx, vary1, vary0, m1, m0, n1, n0){
  alpha=0.05
  p1=n1/(n1+n0)
  p0=1-p1
  sigma2<-vary1*(1-rhoy1)*(1+(m1-1)*rhoy1)/(varx*p1*m1*(1+(m1-2)*rhoy1))+
    vary0*(1-rhoy0)*(1+(m0-1)*rhoy0)/(varx*p0*m0*(1+(m0-2)*rhoy0))
  
  power<-pnorm(sqrt((n1+n0)*eff^2/sigma2)-qnorm(1-alpha/2))
  return (power)
}


#Sample size calculation for IRGT HTE
sample_size_irgt<- function(eff, rhoy1, rhoy0, varx, vary1, vary0, m1, m0, p=0.5){ 
  # p will be a design parameter that says roughly half half split
  beta=0.2
  alpha=0.05
  #optimal sample size allocation
  #p1<-(1+sqrt((vary0*m1*(1-rhoy0)*(1+(m0-1)*rhoy0)*(1+(m1-2)*rhoy1))/(vary1*m0*(1-rhoy1)*(1+(m1-1)*rhoy1)*(1+(m0-2)*rhoy0))))^(-1)
  
  p1=(1-p)*m0/(p*m1+(1-p)*m0)
  p0=1-p1
  
  sigma2<-vary1*(1-rhoy1)*(1+(m1-1)*rhoy1)/(varx*p1*m1*(1+(m1-2)*rhoy1))+
    vary0*(1-rhoy0)*(1+(m0-1)*rhoy0)/(varx*p0*m0*(1+(m0-2)*rhoy0))
  
  n = (qnorm(1-alpha/2) + qnorm(1-beta))^2/(eff^2)*sigma2
  n1 = n*p1 
  n0 = n*p0
  
  nx<-c(ceiling(n1),floor(n0))
  ny<-c(floor(n1),ceiling(n0))
  nz<-c(ceiling(n1),ceiling(n0))
  
  pwx<-power_irgt(eff=eff, rhoy1=rhoy1, rhoy0=rhoy0, varx=varx, vary1=vary1, vary0=vary0, m1=m1, m0=m0, n1=nx[1], n0=nx[2])
  pwy<-power_irgt(eff=eff, rhoy1=rhoy1, rhoy0=rhoy0, varx=varx, vary1=vary1, vary0=vary0, m1=m1, m0=m0, n1=ny[1], n0=ny[2])
  pwz<-power_irgt(eff=eff, rhoy1=rhoy1, rhoy0=rhoy0, varx=varx, vary1=vary1, vary0=vary0, m1=m1, m0=m0, n1=nz[1], n0=nz[2])

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
    
  n10=n1+n0
  N1 = n1*m1
  N0 = n0*m0
  N10=N1+N0
    
  return (c(n1,n0, n10, N1, N0, N10, emp))
}

#test code
#sample_size_irgt(eff=0.5, rhoy1=0.01, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=5, m0=10, p=0.5)

#Sample size calculation for pre-defined scenarios
ss_irgt<-function(eff=0.5){
  #eff=0.5
  vary1=1
  vary0=2
  rhoy1<-c(0.01,0.05,0.10)
  rhoy0<-c(0.01,0.05,0.10)
  m1<-c(4,8,16)
  m0<-c(10,25,50)
  varx=1
  
  S<-length(eff)*length(rhoy1)*length(rhoy0)*length(m1)*length(m0)
  SampleSize<-matrix(NA,S,12)
  colnames(SampleSize)<-c("delta","rhoy1","rhoy0","m1","m0","n1","n0","n10", "N1", "N0", "N10", "emp")
  
  count=1
  for (i0 in 1:length(eff)){
    for (i in 1:length(rhoy1)){
      for (j in 1:length(rhoy0)){
        for (k in 1:length(m1)){
          for (l in 1:length(m0)){
              ss<-sample_size_irgt(eff=eff[i0], rhoy1=rhoy1[i], rhoy0=rhoy0[j], varx=varx, vary1=vary1, vary0=vary0, m1=m1[k], m0=m0[l], p=0.5)
              SampleSize[count,]<-c(eff[i0],rhoy1[i],rhoy0[j],m1[k],m0[l],ss[1],ss[2],ss[3],ss[4],ss[5],ss[6],ss[7])
              count=count+1
          }
        }
      }
    }
  }
  return(SampleSize)
}

#test code
#choose effect size of 0.35
#ss<-ss_irgt(eff=0.35)





