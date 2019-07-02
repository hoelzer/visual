###########################
## A template to generate a simple circular genome plot including one annotation track with the R circlize package.
## Author: hoelzer.martin@gmail.com
##

library(circlize)
library(viridis) # access to nice color palettes

circos.clear()
pdf('circlize_nanopore_phage.pdf', width=4, height=4)

df = data.frame(
    name  = c('Putative phage sequence'),
    start = c(1),
    end   = c(33564)
)

circos.par(
    gap.degree=10, 
    start.degree=85,
    track.height=1
)

circos.genomicInitialize(
    df, plotType=c('axis'), major.by=2000,
    axis.labels.cex = 0.5*par('cex')
)

annotation <- data.frame(
    name= c('pmgM',"hypo","cluster-3140","hypo","Terminase 3","hypo","hypo","hypo","hypo","head-tail con","hypo","hypo","hypo","cluster-7044","hypo","hypo","hypo","PmgQ","hypo","transketolase","transketolase","DegT","GDP-D-mannose","hypo","hypo","hypo","Pas34","hypo","cluster-2696","cluster-1161","hypo","cluster-4608","cluster-4353","putative tail fiber"),
    start = c(72,520,1134,1719,2147,3277,3456,3890,4336,4626,6288,6514,6820,8051,8956,9366,10126,10563,11147,12562,13146,13645,14769,15755,16234,17294,18003,18601,19024,19638,22595,23095,24831,32673),
    end = c(512,1137,1484,2003,3280,3459,3893,4336,4629,6269,6524,6816,7854,8944,9291,10049,10569,11150,12565,13149,13652,14772,15755,16150,17055,18001,18617,19023,19638,22559,23095,24831,32615,33564)
)

# define a nice color code
viridis.colors <- viridis(nrow(annotation))

circos.track(ylim=c(0, 1), bg.border=FALSE, track.height=0.15)

for (row in 1:nrow(annotation)){
    name = annotation[row, 'name']
    start = annotation[row, 'start']
    end = annotation[row, 'end']
    col = viridis.colors[row]
    circos.rect(
        start, 0, end, 1, col=as.character(col))
    circos.text(
        mean(c(start, end)), mean(c(0, 1)), name, 
        cex=0.6, col='black', facing='clockwise', niceFacing=TRUE)}

dev.off()
