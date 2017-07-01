#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/23.Cylinder.Bands/config/Database.23.04.csv ../../bbdd/23.Cylinder.Bands/03.Final.SCV/4/ ../../experiments/23.Cylinder.Bands/results.04/04/ ../../experiments/23.Cylinder.Bands/results.04/04/ 100
cd /home/jlflores/kernel.discretization
