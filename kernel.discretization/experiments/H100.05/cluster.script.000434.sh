#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/05.Haberman.Survival/config/Database.05.04.csv ../../bbdd/05.Haberman.Survival/03.Final.SCV/4/ ../../experiments/05.Haberman.Survival/results.04/04/ ../../experiments/05.Haberman.Survival/results.04/04/ 100
cd /home/jlflores/kernel.discretization
