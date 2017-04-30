AUC    =c(0.0,0.0,0.15,0.23,0.25,0.23,0.18,0.76,0.76,0.79,0.77)
H_Index=c(46,2,16,100,100,17,87,53,50,54,58)

AUC    =c(0,0,0.15,0.22,0.24,0.23, 0.18,0.76, 0.76, 0.79, 0.77)
H_Index=c(1,1,   1,   1,   1,1   ,   87,  53,   50,   54,   58)

df=data.frame(AUC,H_Index)
ggplot(df,aes(x=H_Index,y=AUC))+geom_point(shape=18, color="blue",size=10)+labs(title="Dispersion AUC vs H Index")
