#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/13.Planning.Relax/config/Database.13.09.csv ../../bbdd/13.Planning.Relax/03.Final.SCV/5/ ../../experiments/13.Planning.Relax/results.05/09/ ../../experiments/13.Planning.Relax/results.05/09/ 100
cd /home/jlflores/kernel.discretization
