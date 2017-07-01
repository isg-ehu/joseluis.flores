#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/22.Mamographic.Mass/config/Database.22.06.csv ../../bbdd/22.Mamographic.Mass/03.Final.SCV/6/ ../../experiments/22.Mamographic.Mass/results.06/06/ ../../experiments/22.Mamographic.Mass/results.06/06/ 100
cd /home/jlflores/kernel.discretization
