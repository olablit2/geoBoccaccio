#!/usr/bin/env Rscript
airports <- read.csv("../data/reports/alatielPlaces.csv", header = FALSE)
colnames(airports) <- c("Std","Long","Lat")
head(airports)
install.packages("rworldmap")


library(rworldmap)
newmap <- getMap(resolution = "low")
plot(newmap, xlim = c(-20, 59), ylim = c(35, 71), asp = 1)
points(airports$Lat, airports$Long, col = "red", cex = 1)
