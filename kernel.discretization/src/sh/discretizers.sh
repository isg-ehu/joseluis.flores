#!/bin/bash
R CMD BATCH EqualFrequency.R
R CMD BATCH EqualWidth.R
R CMD BATCH CAIM.R
R CMD BATCH CACC.R
R CMD BATCH Ameva.R
R CMD BATCH Chi2.R
R CMD BATCH ChiM.R
R CMD BATCH extendChi2.R
R CMD BATCH mdlp.R
R CMD BATCH ModChi2.R
mv *.NEW.DISCRETIZED.arff /Users/JoseLuis/Documents/PhD/ddbb/Real/06.Ionosphere/results/03