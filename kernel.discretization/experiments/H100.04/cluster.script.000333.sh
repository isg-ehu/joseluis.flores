#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/04.Pima.Indian.Diabetes/config/Database.04.03.csv ../../bbdd/04.Pima.Indian.Diabetes/03.Final.SCV/4/ ../../experiments/04.Pima.Indian.Diabetes/results.04/03/ ../../experiments/04.Pima.Indian.Diabetes/results.04/03/ 100
cd /home/jlflores/kernel.discretization

