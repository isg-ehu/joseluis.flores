#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/22.Mamographic.Mass/config/Database.22.07.csv ../../bbdd/22.Mamographic.Mass/03.Final.SCV/7/ ../../experiments/22.Mamographic.Mass/results.07/07/ ../../experiments/22.Mamographic.Mass/results.07/07/ 100
cd /home/jlflores/kernel.discretization
