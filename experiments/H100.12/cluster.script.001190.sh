#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/12.Climate.Simulation.Crashes/config/Database.12.10.csv ../../bbdd/12.Climate.Simulation.Crashes/03.Final.SCV/9/ ../../experiments/12.Climate.Simulation.Crashes/results.09/10/ ../../experiments/12.Climate.Simulation.Crashes/results.09/10/ 100
cd /home/jlflores/kernel.discretization
