#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/23.Cylinder.Bands/config/Database.23.09.csv ../../bbdd/23.Cylinder.Bands/03.Final.SCV/9/ ../../experiments/23.Cylinder.Bands/results.09/09/ ../../experiments/23.Cylinder.Bands/results.09/09/ 100
cd /home/jlflores/kernel.discretization
