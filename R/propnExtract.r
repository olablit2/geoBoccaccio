infile <- read.csv("../data/out/conlluCsv/0210.csv", header=FALSE)


dim(infile)

df <- infile[infile[,4]=="PROPN",]

write.csv(df, "../data/out/propn/0210.csv")

