#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/04.Pima.Indian.Diabetes/config/Database.04.10.csv ../../bbdd/04.Pima.Indian.Diabetes/03.Final.SCV/2/ ../../experiments/04.Pima.Indian.Diabetes/results.02/10/ ../../experiments/04.Pima.Indian.Diabetes/results.02/10/ 100
cd /home/jlflores/kernel.discretization
