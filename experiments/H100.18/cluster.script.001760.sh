#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/18.Badges/config/Database.18.10.csv ../../bbdd/18.Badges/03.Final.SCV/6/ ../../experiments/18.Badges/results.06/10/ ../../experiments/18.Badges/results.06/10/ 100
cd /home/jlflores/kernel.discretization
