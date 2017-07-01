#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/18.Badges/config/Database.18.04.csv ../../bbdd/18.Badges/03.Final.SCV/10/ ../../experiments/18.Badges/results.10/04/ ../../experiments/18.Badges/results.10/04/ 100
cd /home/jlflores/kernel.discretization
