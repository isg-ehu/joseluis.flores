#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/06.Ionosphere/config/Database.06.02.csv ../../bbdd/06.Ionosphere/06.Final.SCV/6/ ../../experiments/06.Ionosphere/results.06/02/ ../../experiments/06.Ionosphere/results.06/02/ 100
cd /home/jlflores/kernel.discretization
