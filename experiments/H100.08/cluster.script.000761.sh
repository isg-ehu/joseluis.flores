#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/08.Sonar.Mines.vs.Rocks/config/Database.08.01.csv ../../bbdd/08.Sonar.Mines.vs.Rocks/03.Final.SCV/7/ ../../experiments/08.Sonar.Mines.vs.Rocks/results.07/01/ ../../experiments/08.Sonar.Mines.vs.Rocks/results.07/01/ 100
cd /home/jlflores/kernel.discretization
