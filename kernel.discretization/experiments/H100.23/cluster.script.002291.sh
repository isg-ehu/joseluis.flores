#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/23.Cylinder.Bands/config/Database.23.01.csv ../../bbdd/23.Cylinder.Bands/03.Final.SCV/10/ ../../experiments/23.Cylinder.Bands/results.10/01/ ../../experiments/23.Cylinder.Bands/results.10/01/ 100
cd /home/jlflores/kernel.discretization
