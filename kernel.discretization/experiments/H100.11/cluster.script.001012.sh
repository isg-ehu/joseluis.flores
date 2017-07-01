#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/11.Blood.Transfusion/config/Database.11.02.csv ../../bbdd/11.Blood.Transfusion/04.Final.SCV/2/ ../../experiments/11.Blood.Transfusion/results.02/02/ ../../experiments/11.Blood.Transfusion/results.02/02/ 100
cd /home/jlflores/kernel.discretization
