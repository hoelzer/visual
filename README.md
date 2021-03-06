# Visual

A (hopefully growing) collection of small scripts/templates for data visualisation. 

## Circular genome plot with _circlize_

A simple example plot using the _circlize_ [package](https://jokergoo.github.io/circlize_book/book/). 

```R
Rscript circlize/circlize_nanopore_phage.R
```

![Example PNG image of the scripts output](https://github.com/hoelzer/visual/blob/master/circlize/circlize_nanopore_phage.png)

Labels can be easily adjusted by using [Inkscape](https://inkscape.org), for example.

## Visualize overlapping sets with _UpSetR_

If you have >3 sets to show overlaps, the _UpSetR_ [package](https://github.com/hms-dbmi/UpSetR) is great. 

```bash
conda create -n upsetr -c bioconda r-upsetr
conda activate upsetr
Rscript upsetr/upset.R
```

![Example SVG image of the scripts output](https://github.com/hoelzer/visual/blob/master/upsetr/upsetr.svg)

## Balloon plot

```bash
conda create -n balloon -c r r-ggplot2 r-dplyr r-tidyr r-svglite
conda activate balloon
Rscript balloon/balloon.R balloon/tara.tsv balloon/balloon.svg 10 8  
```

![Example SVG image of the scripts output](https://github.com/hoelzer/visual/blob/master/balloon/balloon.svg)


