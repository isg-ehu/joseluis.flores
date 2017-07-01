#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/04.Pima.Indian.Diabetes/config/Database.04.08.csv ../../bbdd/04.Pima.Indian.Diabetes/03.Final.SCV/4/ ../../experiments/04.Pima.Indian.Diabetes/results.04/08/ ../../experiments/04.Pima.Indian.Diabetes/results.04/08/ 100
cd /home/jlflores/kernel.discretization
