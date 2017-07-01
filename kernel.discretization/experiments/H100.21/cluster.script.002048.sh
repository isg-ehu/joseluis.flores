#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/21.Vertebral.Column/config/Database.21.08.csv ../../bbdd/21.Vertebral.Column/03.Final.SCV/5/ ../../experiments/21.Vertebral.Column/results.05/08/ ../../experiments/21.Vertebral.Column/results.05/08/ 100
cd /home/jlflores/kernel.discretization
