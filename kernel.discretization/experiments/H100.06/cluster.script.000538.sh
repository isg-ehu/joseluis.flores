#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/06.Ionosphere/config/Database.06.08.csv ../../bbdd/06.Ionosphere/06.Final.SCV/4/ ../../experiments/06.Ionosphere/results.04/08/ ../../experiments/06.Ionosphere/results.04/08/ 100
cd /home/jlflores/kernel.discretization
