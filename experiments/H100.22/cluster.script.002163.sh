#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/22.Mamographic.Mass/config/Database.22.03.csv ../../bbdd/22.Mamographic.Mass/03.Final.SCV/7/ ../../experiments/22.Mamographic.Mass/results.07/03/ ../../experiments/22.Mamographic.Mass/results.07/03/ 100
cd /home/jlflores/kernel.discretization

