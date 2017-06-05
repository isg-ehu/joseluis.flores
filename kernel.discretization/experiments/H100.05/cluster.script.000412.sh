#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/05.Haberman.Survival/config/Database.05.02.csv ../../bbdd/05.Haberman.Survival/03.Final.SCV/2/ ../../experiments/05.Haberman.Survival/results.02/02/ ../../experiments/05.Haberman.Survival/results.02/02/ 100 &
cd /home/jlflores/kernel.discretization
