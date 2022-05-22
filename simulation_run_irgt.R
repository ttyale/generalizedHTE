###############################################################
#### Sample simulation run and output #########################
###############################################################
#load function
source(".../simulation_functions_irgt.R")


#1

start_time <- Sys.time()
delta035_001_001<-rbind(
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=4, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=4, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=4, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=8, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=8, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=8, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=16, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=16, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=16, m0=50, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta035_001_001,"delta035_001_001.csv")

#2 

start_time <- Sys.time()
delta035_001_005<-rbind(
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=4, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=4, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=4, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=8, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=8, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=8, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=16, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=16, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=16, m0=50, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta035_001_005,"delta035_001_005.csv")

#3

start_time <- Sys.time()
delta035_001_010<-rbind(
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=4, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=4, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=4, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=8, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=8, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=8, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=16, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=16, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.01, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=16, m0=50, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta035_001_010,"delta035_001_010.csv")

#4

start_time <- Sys.time()
delta035_005_001<-rbind(
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=4, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=4, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=4, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=8, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=8, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=8, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=16, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=16, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=16, m0=50, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta035_005_001,"delta035_005_001.csv")


#5

start_time <- Sys.time()
delta035_005_005<-rbind(
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=4, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=4, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=4, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=8, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=8, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=8, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=16, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=16, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=16, m0=50, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta035_005_005,"delta035_005_005.csv")

#6

start_time <- Sys.time()
delta035_005_010<-rbind(
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=4, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=4, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=4, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=8, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=8, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=8, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=16, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=16, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.05, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=16, m0=50, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta035_005_010,"delta035_005_010.csv")

#7

start_time <- Sys.time()
delta035_010_001<-rbind(
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=4, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=4, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=4, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=8, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=8, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=8, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=16, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=16, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.01, varx=1, vary1=1, vary0=2, m1=16, m0=50, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta035_010_001,"delta035_010_001.csv")

#8

start_time <- Sys.time()
delta035_010_005<-rbind(
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=4, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=4, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=4, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=8, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=8, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=8, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=16, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=16, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.05, varx=1, vary1=1, vary0=2, m1=16, m0=50, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta035_010_005,"delta035_010_005.csv")

#9

start_time <- Sys.time()
delta035_010_010<-rbind(
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=4, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=4, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=4, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=8, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=8, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=8, m0=50, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=16, m0=10, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=16, m0=25, p=0.5,nsim=5000),
  sim_irgt(eff=0.35, rhoy1=0.10, rhoy0=0.10, varx=1, vary1=1, vary0=2, m1=16, m0=50, p=0.5,nsim=5000)
)
end_time <- Sys.time()
end_time - start_time
write.csv(delta035_010_010,"delta035_010_010.csv")

