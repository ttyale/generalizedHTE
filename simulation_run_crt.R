###############################################################
#### Sample simulation run and output #########################
###############################################################

#load function
source(".../simulation_functions_crt.R")

#1

start_time <- Sys.time()
delta020_001_001<-rbind(
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.01, rhox=0.01, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.01, rhox=0.01, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.01, rhox=0.01, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.01, rhox=0.25, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.01, rhox=0.25, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.01, rhox=0.25, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.01, rhox=0.50, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.01, rhox=0.50, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.01, rhox=0.50, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta020_001_001,"delta020_001_001.csv")

#2 

start_time <- Sys.time()
delta020_001_005a<-rbind(
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.05, rhox=0.01, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.05, rhox=0.01, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.05, rhox=0.01, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.05, rhox=0.25, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.05, rhox=0.25, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.05, rhox=0.25, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.05, rhox=0.50, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.05, rhox=0.50, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.05, rhox=0.50, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000)
)

end_time <- Sys.time()
end_time - start_time
write.csv(rbind(delta020_001_005a,delta020_001_005b),"delta020_001_005.csv")

#3

start_time <- Sys.time()
delta020_001_010a<-rbind(
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.10, rhox=0.01, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.10, rhox=0.01, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.10, rhox=0.01, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.10, rhox=0.25, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.10, rhox=0.25, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.10, rhox=0.25, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.10, rhox=0.50, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.10, rhox=0.50, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.01, rhoy0=0.10, rhox=0.50, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time

write.csv(cbind(delta020_001_010a,delta020_001_010b),"delta020_001_010.csv")

#4

start_time <- Sys.time()
delta020_005_001<-rbind(
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.01, rhox=0.01, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.01, rhox=0.01, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.01, rhox=0.01, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.01, rhox=0.25, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.01, rhox=0.25, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.01, rhox=0.25, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.01, rhox=0.50, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.01, rhox=0.50, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.01, rhox=0.50, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta020_005_001,"delta020_005_001.csv")


#5

start_time <- Sys.time()
delta020_005_005<-rbind(
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.05, rhox=0.01, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.05, rhox=0.01, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.05, rhox=0.01, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.05, rhox=0.25, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.05, rhox=0.25, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.05, rhox=0.25, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.05, rhox=0.50, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.05, rhox=0.50, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.05, rhox=0.50, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta020_005_005,"delta020_005_005.csv")

#6

start_time <- Sys.time()
delta020_005_010<-rbind(
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.10, rhox=0.01, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.10, rhox=0.01, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.10, rhox=0.01, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.10, rhox=0.25, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.10, rhox=0.25, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.10, rhox=0.25, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.10, rhox=0.50, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.10, rhox=0.50, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.05, rhoy0=0.10, rhox=0.50, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta020_005_010,"delta020_005_010.csv")

#7

start_time <- Sys.time()
delta020_010_001<-rbind(
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.01, rhox=0.01, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.01, rhox=0.01, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.01, rhox=0.01, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.01, rhox=0.25, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.01, rhox=0.25, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.01, rhox=0.25, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.01, rhox=0.50, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.01, rhox=0.50, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.01, rhox=0.50, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta020_010_001,"delta020_010_001.csv")


#8

start_time <- Sys.time()
delta020_010_005<-rbind(
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.05, rhox=0.01, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.05, rhox=0.01, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.05, rhox=0.01, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.05, rhox=0.25, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.05, rhox=0.25, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.05, rhox=0.25, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.05, rhox=0.50, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.05, rhox=0.50, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.05, rhox=0.50, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta020_010_005,"delta020_010_005.csv")


#9

start_time <- Sys.time()
delta020_010_010<-rbind(
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.10, rhox=0.01, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.10, rhox=0.01, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.10, rhox=0.01, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.10, rhox=0.25, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.10, rhox=0.25, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.10, rhox=0.25, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000),
  
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.10, rhox=0.50, varx=1, vary1=1, vary0=2, m1=20, m0=20, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.10, rhox=0.50, varx=1, vary1=1, vary0=2, m1=50, m0=50, p=0.5,nsim=5000),
  sim_crt(eff=0.2, rhoy1=0.10, rhoy0=0.10, rhox=0.50, varx=1, vary1=1, vary0=2, m1=100, m0=100, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta020_010_010,"delta020_010_010.csv")
