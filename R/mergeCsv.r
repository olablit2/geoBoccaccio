#

## install.packages("tidyverse")
## write.csv(dataset, "../data/out/propn/total.csv")#
#

##library(tidyverse)#

# list.files(path = "../data/out/conlluCsv/",
#              pattern="*.csv", 
#              full.names = T) %>% 
#    map_df(~read_csv(.))#

#write_csv(surveys_complete, path = "data_output/surveys_complete.csv")



setwd("/home/marco/git/geoBoccaccio/data/out/propn/") ## where file are located

path = "/home/marco/git/geoBoccaccio/data/out/propn/"
out.file <- ""
file.names <- dir(path, pattern = ".csv")
for(i in 1:length(file.names)){
  file <- read.csv(file.names[i], header = FALSE, stringsAsFactors = FALSE)
  out.file <- rbind(out.file, file)
}

write.csv(out.file, file = "../data/out/propn/total.csv", row.names = FALSE) ## directory to write stacked file to

past_due_global_stacked <- read.csv("../data/out/propn/prova.csv", stringsAsFactors = FALSE)

files <- list.files(pattern = "\\.csv$") %>%  t() %>% paste(collapse = ", ")