#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/13.Planning.Relax/config/Database.13.08.csv ../../bbdd/13.Planning.Relax/03.Final.SCV/1/ ../../experiments/13.Planning.Relax/results.01/08/ ../../experiments/13.Planning.Relax/results.01/08/ 100
cd /home/jlflores/kernel.discretization
