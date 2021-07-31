###################################set directories###########################################
wd <- ("/Users/sepideh/src/Rrepos/data_incubator/input_data")
if(!is.null(wd)){setwd(wd)}

###################################read the coverage table###################################
covdf <- read.table("cov_otvsar.txt", sep="\t", header=T, as.is=T)


################################### Define variables ########################################
AP <- covdf[,2]
OT <- covdf[,3]


######################## scatter plots of each variable#####################################
pdf("breath of coverage overlay.pdf")
par(mfrow=c(1,1))
x<- 1:length(AP)
plot(x, AP, col = 'red', xlab="sample  number", ylab="breath of coverage", 
     main ="Amplicon- versus Targeted-Whole genome NGS", pch = 10, bty="L")
par(new=TRUE)
plot(x, OT, col = 'green', pch = 10, xlab=" ", ylab="", bty="L", axes=FALSE)
legend (x="bottomright", inset = c(-0.05, -0.2), legend = c("Amplicon NGS","Targeted NGS"), pch=19, col= c("red","green"),  bty="n",xpd = TRUE)
dev.off() 

pdf("breath of coverage.pdf")
par(mfrow=c(2,1))
plot(x, AP, col = 'blue', xlab="sample number", ylab="WG breath of coverage", main ="Amplicon NGS", pch = 10)
plot(x, OT, col = 'red',xlab="sample number", ylab="WG breath of coverage", main ="Targeted NGS", pch = 10)
dev.off() 
