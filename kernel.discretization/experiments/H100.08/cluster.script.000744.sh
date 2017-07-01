#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/08.Sonar.Mines.vs.Rocks/config/Database.08.04.csv ../../bbdd/08.Sonar.Mines.vs.Rocks/03.Final.SCV/5/ ../../experiments/08.Sonar.Mines.vs.Rocks/results.05/04/ ../../experiments/08.Sonar.Mines.vs.Rocks/results.05/04/ 100
cd /home/jlflores/kernel.discretization
