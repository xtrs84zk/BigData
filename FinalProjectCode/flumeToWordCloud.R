# load packages
library(RCurl)
library(RJSONIO)
library(NLP)
library(stringr)
library(tm)
library(RColorBrewer)
library(wordcloud)


## i don't really need the warnings
options(warn = -1)

##Cargando función de limpieza de Tweets
source("cleanRawTweets.R")


# get text
tweet_txt <- readLines("/Users/xtrs84zk/Documents/test/temp/mapreduceUsableByWordCloud.txt") #add file here

# cleaning text
tweet_clean = clean.text(tweet_txt)
specificStopWords <- c("linux", "iphone", "android", "app", "relnofollowtwitter", "relnofollowtwier", "iphonea", "androida", "href", "name", "added", "number", "use", "may", "like", "los", "las", "que", "will", "can", "using", "appa", "around", "many", "much", "con", "vez", "often", "del", "another", "even", "see", "also", "por", "para", "one", "sure", "still", "well", "means", "una", "dos", "como", "ser", "users", "file", " . ")
tweet_clean = removeWords(tweet_clean, specificStopWords)
tweet_clean = removeWords(tweet_clean, stopwords("english"))
tweet_clean = removeWords(tweet_clean, stopwords("spanish"))

##making the wordcloud (if running from terminal, it'll be exported on a pdf)
wordcloud(tweet_clean, min.freq = 20, max.freq = 1000, max.words = 1000, random.order = FALSE, colors = brewer.pal(8, "Dark2"))