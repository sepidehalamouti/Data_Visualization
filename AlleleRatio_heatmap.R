library(gplots)

################################## set directories ############################################
wd <- ("/Users/sepideh/src/Rrepos/data_incubator/input_data")
if(!is.null(wd)){setwd(wd)}

###################################create data frame ##########################################
data <- read.table("AR_OT.txt", sep="\t", header=T, as.is=T)
ARdf <- read.table("AR_OT.txt", row.names = data[,1], sep="\t", header=T, as.is=T)

############################ heat map of allele ratio data frame ##############################
df <- as.matrix(ARdf[,-1])
col = colorRampPalette(c("darkred","yellow","blue"))(n = 3)
breaks <- c(0,5,95,100)
pdf("Alternate allele ratio.pdf",15,15)
heatmap.2(df, breaks = breaks, keysize=0.6, main = "Alternate Allele Ratio", trace=c("column"),tracecol="cyan", linecol="darkred", 
          col = col, na.color="black",density.info = "none", margins=c(5,4), cex=0.7, cexRow=0.7)
dev.off() 
