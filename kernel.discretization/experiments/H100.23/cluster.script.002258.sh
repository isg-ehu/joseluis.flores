#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/23.Cylinder.Bands/config/Database.23.08.csv ../../bbdd/23.Cylinder.Bands/03.Final.SCV/6/ ../../experiments/23.Cylinder.Bands/results.06/08/ ../../experiments/23.Cylinder.Bands/results.06/08/ 100
cd /home/jlflores/kernel.discretization
