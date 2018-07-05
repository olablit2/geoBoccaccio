# reads content of file as plain text
GetFileContent <- function(fileName){
    readedText <- readLines(fileName, encoding="UTF-8")
    readedText <- do.call(paste, c(as.list(readedText), sep=" "))
    return(readedText)
}

# define text sample
x <- GetFileContent("/home/marco/Documenti/projects/boccaccio-geo/data/partials/0207.txt")

install.packages("udpipe")
vignette("udpipe-tryitout", package = "udpipe")
vignette("udpipe-annotation", package = "udpipe")
vignette("udpipe-train", package = "udpipe")
vignette("udpipe-usecase-postagging-lemmatisation", package = "udpipe")
vignette("udpipe-usecase-topicmodelling", package = "udpipe")

library(udpipe)
dl <- udpipe_download_model(language = "italian")
dl

udmodel_italian <- udpipe_load_model(file = "italian-ud-2.0-170801.udpipe")
x <- udpipe_annotate(udmodel_italian,  x = GetFileContent("/home/marco/Documenti/projects/boccaccio-geo/data/partials/0207.txt"))
cat(x$conllu, file="alatiel.conllu")
# x <- as.data.frame(x)
