#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/08.Sonar.Mines.vs.Rocks/config/Database.08.10.csv ../../bbdd/08.Sonar.Mines.vs.Rocks/03.Final.SCV/9/ ../../experiments/08.Sonar.Mines.vs.Rocks/results.09/10/ ../../experiments/08.Sonar.Mines.vs.Rocks/results.09/10/ 100
cd /home/jlflores/kernel.discretization
