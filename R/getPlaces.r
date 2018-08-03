# Merge the dataframes basing on "Standardized" col



# Carico i due file da combinare
df1 <- read.csv("/home/marco/git/geoBoccaccio/data/out/propn/total/geoCities.csv", header=TRUE)
df2 <- read.csv("/home/marco/git/geoBoccaccio/data/out/propn/total/final.csv", header=TRUE)


## creo il sottoinsieme

df2_subset <- data.frame(df2$V2,df$V3,df2$Standardized)

## Cambio nome all'header del dataframe generato. Qui la colonna interessata è 'standardized'


names(df2_subset)[3] <- "Standardized"


# Combino i dataframe

df3 <- merge(df2_subset, df_1, by='Standardized')

# Controllo i dati

head(df3)

# 	          Standardized      df2.V2      df2.V3       lon      lat
# 	1                 Acri        Acri        Acri 35.082678 32.93305
# 	2            Agrigento    Gergenti    Gergento 13.585982 37.30941
# 	3        Aigues Mortes   Aguamorta   Aguamorto  4.192587 43.56717
# 	4            Alba (CN)        Alba        alba  8.035691 44.70092
# 	5 Alessandria d'Egitto Alessandria Alessandria 29.918739 31.20009
# 	6 Alessandria d'Egitto Alessandria Alessandria 29.918739 31.20009

# Tutto ok. allora lo salvo su file


write.csv(df3, "data/out/places/totalPlaces.csv")



# Prendo gli output generati dalle singole novelle e li combino con il df con le coordinate


datasource <- read.csv("data/out/places/totalPlaces.csv", header=TRUE)

# dim(datasource) == 261, 6




# Aggiungo le coordinate agli output dei singoli file e creo i csv corrispondenti

for (infile in 1:9){
	indata <- read.csv(paste0("data/out/propn/020",infile,".csv"), header=TRUE)
	outfile <- merge(indata, datasource,  by='V2', sort=F)
	write.csv(outfile, paste0("data/out/places/020",infile,".csv") )
}

	indata <- read.csv("data/out/propn/0210.csv", header=TRUE)
	outfile <- merge(indata, datasource,  by='V2', sort=F)
	write.csv(outfile, "data/out/places/0210.csv") 


# Creo le mappe in loop


library(ggmap)

map <- get_map(location='Europe', zoom=3)


for (infile in 1:9){

	partialPlaces = read.csv(paste0("data/out/places/020",infile,".csv"), header=TRUE)

	mapPoints <- ggmap(map) + geom_point(aes(x=lon, y=lat), data = partialPlaces, alpha=.8)

	ggsave(paste0("data/out/maps/020",infile,".png"),mapPoints, width=15, height=15)

}

	partialPlaces = read.csv("data/out/places/0210.csv", header=TRUE)

	mapPoints <- ggmap(map) + geom_point(aes(x=lon, y=lat), data = partialPlaces, alpha=.8)

	ggsave("data/out/maps/0210.png",mapPoints, width=15, height=15)


# Creo la mappa totale

	mapPoints <- ggmap(map) + geom_point(aes(x=lon, y=lat), data = datasource, alpha=.8)

	ggsave("data/out/maps/placesProva.png",mapPoints, width=15, height=15)