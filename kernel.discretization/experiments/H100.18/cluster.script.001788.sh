#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/18.Badges/config/Database.18.08.csv ../../bbdd/18.Badges/03.Final.SCV/9/ ../../experiments/18.Badges/results.09/08/ ../../experiments/18.Badges/results.09/08/ 100
cd /home/jlflores/kernel.discretization
