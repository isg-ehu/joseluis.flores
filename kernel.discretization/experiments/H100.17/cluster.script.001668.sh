#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/17.Parkinsons/config/Database.17.08.csv ../../bbdd/17.Parkinsons/03.Final.SCV/7/ ../../experiments/17.Parkinsons/results.07/08/ ../../experiments/17.Parkinsons/results.07/08/ 100
cd /home/jlflores/kernel.discretization
