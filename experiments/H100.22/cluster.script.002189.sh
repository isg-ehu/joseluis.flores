#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/22.Mamographic.Mass/config/Database.22.09.csv ../../bbdd/22.Mamographic.Mass/03.Final.SCV/9/ ../../experiments/22.Mamographic.Mass/results.09/09/ ../../experiments/22.Mamographic.Mass/results.09/09/ 100
cd /home/jlflores/kernel.discretization
