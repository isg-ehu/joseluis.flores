#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/08.Sonar.Mines.vs.Rocks/config/Database.08.03.csv ../../bbdd/08.Sonar.Mines.vs.Rocks/03.Final.SCV/6/ ../../experiments/08.Sonar.Mines.vs.Rocks/results.06/03/ ../../experiments/08.Sonar.Mines.vs.Rocks/results.06/03/ 100
cd /home/jlflores/kernel.discretization

