#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/04.Pima.Indian.Diabetes/config/Database.04.07.csv ../../bbdd/04.Pima.Indian.Diabetes/03.Final.SCV/8/ ../../experiments/04.Pima.Indian.Diabetes/results.08/07/ ../../experiments/04.Pima.Indian.Diabetes/results.08/07/ 100 &
cd /home/jlflores/kernel.discretization
