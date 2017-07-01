#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/18.Badges/config/Database.18.05.csv ../../bbdd/18.Badges/03.Final.SCV/7/ ../../experiments/18.Badges/results.07/05/ ../../experiments/18.Badges/results.07/05/ 100
cd /home/jlflores/kernel.discretization
