#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/13.Planning.Relax/config/Database.13.03.csv ../../bbdd/13.Planning.Relax/03.Final.SCV/2/ ../../experiments/13.Planning.Relax/results.02/03/ ../../experiments/13.Planning.Relax/results.02/03/ 100
cd /home/jlflores/kernel.discretization

