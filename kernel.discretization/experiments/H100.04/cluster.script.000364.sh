#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/04.Pima.Indian.Diabetes/config/Database.04.04.csv ../../bbdd/04.Pima.Indian.Diabetes/03.Final.SCV/7/ ../../experiments/04.Pima.Indian.Diabetes/results.07/04/ ../../experiments/04.Pima.Indian.Diabetes/results.07/04/ 100
cd /home/jlflores/kernel.discretization
