#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/22.Mamographic.Mass/config/Database.22.04.csv ../../bbdd/22.Mamographic.Mass/03.Final.SCV/4/ ../../experiments/22.Mamographic.Mass/results.04/04/ ../../experiments/22.Mamographic.Mass/results.04/04/ 100
cd /home/jlflores/kernel.discretization
