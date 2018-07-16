#!/usr/bin/env Rscript
airports <- read.csv("../data/reports/alatielPlaces.csv", header = FALSE)
colnames(airports) <- c("Std","Long","Lat")
head(airports)
install.packages("rworldmap")


library(rworldmap)
newmap <- getMap(resolution = "low")
plot(newmap, xlim = c(-10, 60), ylim = c(20, 60), asp = 1)
points(airports$Lat, airports$Long, col = "red", cex = 1)
