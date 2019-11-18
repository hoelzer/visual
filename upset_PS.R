#https://cran.r-project.org/web/packages/UpSetR/vignettes/basic.usage.html

library(UpSetR)

files_for_upset <- list.files(path="subsets/",full.names=T)

sets <- lapply(files_for_upset,readLines)

sets_names <- sapply(files_for_upset,function(x){
  splits <- strsplit(strsplit(x,"//")[[1]][2],"_")[[1]]
  return(paste0(substr(splits[1],1,1),substr(splits[2],1,2)))
})
names(sets) <- sets_names


# sets <- list(
# Cab = as.character(read.csv("subsets/Chlamydia_abortus_S26-3_RENAMED_subset.txt", header = F, sep = ",", stringsAsFactors = F)$V1),
# Cav = as.character(read.csv("subsets/Chlamydia_avium_10DC88_RENAMED_subset.txt", header = F, sep = ",", stringsAsFactors = F)$V1),
# Cfe = as.character(read.csv("subsets/Chlamydia_felis_Fe-C-56_RENAMED_subset.txt", header = F, sep = ",", stringsAsFactors = F)$V1),
# Cib = as.character(read.csv("subsets/Chlamydia_ibidis_10-1398-6_RENAMED_subset.txt", header = F, sep = ",", stringsAsFactors = F)$V1),
# Cmu = as.character(read.csv("subsets/Chlamydia_muridarum_Nigg_RENAMED_subset.txt", header = F, sep = ",", stringsAsFactors = F)$V1),
# Csu = as.character(read.csv("subsets/Chlamydia_suis_SWA-2_RENAMED_subset.txt", header = F, sep = ",", stringsAsFactors = F)$V1),
# Cca = as.character(read.csv("subsets/Chlamydophila_caviae_GPIC_RENAMED_subset.txt", header = F, sep = ",", stringsAsFactors = F)$V1),
# Cpe = as.character(read.csv("subsets/Chlamydophila_pecorum_E58_RENAMED_subset.txt", header = F, sep = ",", stringsAsFactors = F)$V1),
# Cpn = as.character(read.csv("subsets/Chlamydophila_pneumoniae_CWL029_RENAMED_subset.txt", header = F, sep = ",", stringsAsFactors = F)$V1),
# Cps = as.character(read.csv("subsets/Chlamydia_psittaci_6BC_RENAMED_subset.txt", header = F, sep = ",", stringsAsFactors = F)$V1),
# Cga = as.character(read.csv("subsets/Chlamydia_gallinacea_08-1274-3_RENAMED_subset.txt", header = F, sep = ",", stringsAsFactors = F)$V1),
# Ctr = as.character(read.csv("subsets/Chlamydia_trachomatis_D-UW-3-CX_RENAMED_subset.txt", header = F, sep = ",", stringsAsFactors = F)$V1))

svg(filename="upsetr.svg", 
    width=14, 
    height=12, 
    pointsize=12)
upset(fromList(sets), nsets = 20, nintersects = 40, sets = c("Ctr","Cmu","Csu","Cpn","Cpe","Cib","Cga","Cav","Cfe","Cca","Cps","Cab"), # sets=names(sets)
    mainbar.y.label = "No. of common genes", sets.x.label = "No. of annotated genes", 
    order.by = "freq", sets.bar.color = "#56B4E9", keep.order = T, 
    text.scale = 1.4, point.size = 2.6, line.size = 0.8,
    set_size.show = TRUE, empty.intersections = "off")
dev.off()
