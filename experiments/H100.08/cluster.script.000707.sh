#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/08.Sonar.Mines.vs.Rocks/config/Database.08.07.csv ../../bbdd/08.Sonar.Mines.vs.Rocks/03.Final.SCV/1/ ../../experiments/08.Sonar.Mines.vs.Rocks/results.01/07/ ../../experiments/08.Sonar.Mines.vs.Rocks/results.01/07/ 100
cd /home/jlflores/kernel.discretization
