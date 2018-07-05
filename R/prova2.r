library(udpipe)
data(../data/sample)
comments <- data

ud_model <- udpipe_download_model(language = "italian")
ud_model <- udpipe_load_model(ud_model$file_model)
x <- udpipe_annotate(ud_model, x = comments)
x <- as.data.frame(x)