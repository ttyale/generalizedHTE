
###############################################################
####   Power calculator for CRT based on HTE effect size  #####
###############################################################
power_crt<- function(eff, rhoy1, rhoy0, rhox, varx, vary1, vary0, m1, m0, n1, n0){
  
  #eff: effect size
  #rhoy1: outcome ICC in trt arm
  #rhoy0: outcome ICC in ctr arm
  #varx: covariate variance
  #vary1: outcome variance in trt arm
  #vary0: outcome variance in ctr arm
  #m1: cluster size in trt arm
  #m0: cluster size in ctr arm
  #n1: number of clusers in trt arm
  #n0: number of clusters in the ctr arm
  
  alpha=0.05
  p1=n1/(n1+n0)
  p0=1-p1
  sigma2<-vary1*(1-rhoy1)*(1+(m1-1)*rhoy1)/(varx*p1*m1*(1+(m1-2)*rhoy1-(m1-1)*rhox*rhoy1))+
    vary0*(1-rhoy0)*(1+(m0-1)*rhoy0)/(varx*p0*m0*(1+(m0-2)*rhoy0-(m0-1)*rhox*rhoy0))
  
  power<-pnorm(sqrt((n1+n0)*eff^2/sigma2)-qnorm(1-alpha/2))
  return (power)
}

#####################################################################
####   Sample size calculator for CRT based on HTE effect size  #####
#####################################################################

sample_size_crt<- function(beta=0.2, eff, rhoy1, rhoy0, rhox, varx, vary1, vary0, m1, m0, p=0.5, equal=TRUE){
  
  #beta: type II error rate, which is one minus power
  #eff: effect size
  #rhoy1: outcome ICC in trt arm
  #rhoy0: outcome ICC in ctr arm
  #varx: covariate variance
  #vary1: outcome variance in trt arm
  #vary0: outcome variance in ctr arm
  #m1: cluster size in trt arm
  #m0: cluster size in ctr arm
  #p: a design parameter that indicates (roughly) the sample size split between the two arms
  
  beta=beta
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
  
  if (pwx<(1-beta) & pwy<(1-beta)) {
    n1=nz[1]
    n0=nz[2]
    emp=pwz
  }
  
  if (pwx>(1-beta) & pwy<(1-beta)){
    n1=nx[1]
    n0=nx[2]
    emp=pwx
  }
  
  if (pwx<(1-beta) & pwy>(1-beta)){
    n1=ny[1]
    n0=ny[2]
    emp=pwy
  }
  
  if (pwx>(1-beta) & pwy>(1-beta)){
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


################################################################
####   Power calculator for IRGT based on HTE effect size  #####
################################################################

power_irgt<- function(eff, rhoy1, rhoy0, varx, vary1, vary0, m1, m0, n1, n0){
  
  #eff: effect size
  #rhoy1: outcome ICC in trt arm
  #rhoy0: outcome ICC in ctr arm
  #varx: covariate variance
  #vary1: outcome variance in trt arm
  #vary0: outcome variance in ctr arm
  #m1: cluster size in trt arm
  #m0: cluster size in ctr arm
  #n1: number of clusers in trt arm
  #n0: number of clusters in the ctr arm
  
  alpha=0.05
  p1=n1/(n1+n0)
  p0=1-p1
  sigma2<-vary1*(1-rhoy1)*(1+(m1-1)*rhoy1)/(varx*p1*m1*(1+(m1-2)*rhoy1))+
    vary0*(1-rhoy0)*(1+(m0-1)*rhoy0)/(varx*p0*m0*(1+(m0-2)*rhoy0))
  
  power<-pnorm(sqrt((n1+n0)*eff^2/sigma2)-qnorm(1-alpha/2))
  return (power)
}


######################################################################
####   Sample size calculator for IRGT based on HTE effect size  #####
######################################################################
sample_size_irgt<- function(beta= 0.2, eff, rhoy1, rhoy0, varx, vary1, vary0, m1, m0, p=0.5){ 
  
  #beta: type II error rate, which is one minus power
  #eff: effect size
  #rhoy1: outcome ICC in trt arm
  #rhoy0: outcome ICC in ctr arm
  #varx: covariate variance
  #vary1: outcome variance in trt arm
  #vary0: outcome variance in ctr arm
  #m1: cluster size in trt arm
  #m0: cluster size in ctr arm
  #p: a design parameter that indicates (roughly) the sample size split between the two arms
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
  
  if (pwx<(1-beta) & pwy<(1-beta)) {
    n1=nz[1]
    n0=nz[2]
    emp=pwz
  }
  
  if (pwx>(1-beta) & pwy<(1-beta)){
    n1=nx[1]
    n0=nx[2]
    emp=pwx
  }
  
  if (pwx<(1-beta) & pwy>(1-beta)){
    n1=ny[1]
    n0=ny[2]
    emp=pwy
  }
  
  if (pwx>(1-beta) & pwy>(1-beta)){
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
