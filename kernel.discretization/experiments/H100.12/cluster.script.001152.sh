#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/12.Climate.Simulation.Crashes/config/Database.12.02.csv ../../bbdd/12.Climate.Simulation.Crashes/03.Final.SCV/6/ ../../experiments/12.Climate.Simulation.Crashes/results.06/02/ ../../experiments/12.Climate.Simulation.Crashes/results.06/02/ 100
cd /home/jlflores/kernel.discretization
