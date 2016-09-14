#get data
##https://rstudio-pubs-static.s3.amazonaws.com/31867_8236987cf0a8444e962ccd2aec46d9c3.html#loading-texts
#Tokenization - identifying appropriate tokens such as words, punctuation, and numbers. Writing a function that takes a file as input and returns a tokenized version of it.
#Profanity filtering - removing profanity and other words you do not want to predict.
##setwd("C:/Users/stephen.p.duffy/Documents/GitHub/DSCapstone")

library(tm)
library(plyr)
setwd("C:/Users/stephen.p.duffy/Documents/GitHub/DSCapstone")

dir <- DirSource("./Coursera-Swiftkey/final/en_US", ignore.case = TRUE,mode = "text")

o <- data.frame(String=character())

 for (i in 1:3) {
     
     con <- file(dir$filelist[i],"r")
     g <- as.data.frame(readLines(con,3000000))
     names(g) <- c("String")
     o <- rbind(g,o)
     rm(g)
     close(con)
 
 }
 
#select Random sample
 set.seed(2317)
 ins <- rbinom(nrow(o),1,.05)
 d <- cbind(o,as.data.frame(ins))
 test <- subset(o,ins == 1)
 test[,1] <- as.character(test[,1])

 rm(d,o,con,i,ins)

#  blogs <- as.data.frame(readLines(file(f$filelist[1],"r"),1000000))
#  news <- as.data.frame(readLines(file(f$filelist[2],"r"),2000000))
#  twitter <- as.data.frame(readLines(file(f$filelist[3],"r"),3000000))

 
 dfs <- DataframeSource(test)
 ##docs <- Corpus(dir)
 docsdf <- Corpus(dfs, list(lanuage = "en_US"))
 
 #as.character(inspect(docsdf[2]))
 
 docsdf <- tm_map(docsdf, removeWords, stopwords("english")) 
 docsdf <- tm_map(docsdf, content_transformer(removePunctuation)) 
 docsdf   <- tm_map(docsdf, content_transformer(removeNumbers))
 docsdf <- tm_map(docsdf, content_transformer(tolower))
 
 for(j in seq(docsdf))   
 {   
     docsdf[[j]] <- gsub("/", " ", docsdf[[j]])   
     docsdf[[j]] <- gsub("@", " ", docsdf[[j]])  
     docsdf[[j]] <- gsub("#", " ", docsdf[[j]])
     docsdf[[j]] <- gsub(")", " ", docsdf[[j]])   
 } 
 
 
 library(SnowballC)   
 docsdf <- tm_map(docsdf, content_transformer(stemDocument))
 docsdf <- tm_map(docsdf, content_transformer(stripWhitespace) )
 docsdf <- tm_map(docsdf, PlainTextDocument) 
 
 dtm <- DocumentTermMatrix(docsdf)
 inspect(dtm[1:5, 1:20])
 
 tdm <- TermDocumentMatrix(docsdf)
