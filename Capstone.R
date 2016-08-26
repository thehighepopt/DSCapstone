#get data

#Tokenization - identifying appropriate tokens such as words, punctuation, and numbers. Writing a function that takes a file as input and returns a tokenized version of it.
#Profanity filtering - removing profanity and other words you do not want to predict.
##setwd("C:/Users/stephen.p.duffy/Documents/GitHub/DSCapstone")

library(tm)
library(plyr)
#setwd("C:/Users/stephen.p.duffy/Documents/GitHub/DSCapstone")

dir <- DirSource("./Coursera-Swiftkey/final/en_US", ignore.case = TRUE,mode = "text")
corpus <- Corpus(dir)

# 
# o <- data.frame(String=character())
# 
# for (i in 1:3) {
#     
#     con <- file(f$filelist[i],"r")
#     g <- as.data.frame(readLines(con,3000000))
#     names(g) <- c("String")
#     o <- rbind(g,o)
#     rm(g)
#     close(con)
# 
# }
# 
#select Random sample
# set.seed(2317)
# ins <- rbinom(nrow(o),1,.05)
# d <- cbind(o,as.data.frame(ins))
# test <- subset(o,ins == 1)
# 
# rm(d,o,con,i,ins,f)
# 
# blogs <- as.data.frame(readLines(file(f$filelist[1],"r"),1000000))
# news <- as.data.frame(readLines(file(f$filelist[2],"r"),2000000))
# twitter <- as.data.frame(readLines(file(f$filelist[3],"r"),3000000))

