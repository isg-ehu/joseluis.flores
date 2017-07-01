#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/17.Parkinsons/config/Database.17.07.csv ../../bbdd/17.Parkinsons/03.Final.SCV/6/ ../../experiments/17.Parkinsons/results.06/07/ ../../experiments/17.Parkinsons/results.06/07/ 100
cd /home/jlflores/kernel.discretization
