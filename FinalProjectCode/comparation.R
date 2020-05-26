# load packages
library(twitteR)
library(igraph)
library(stringr)
library("tm")
library("wordcloud")
library("NLP")

##Inicializando Twitter Auth
source("twitterAuth.R")

##not really a word, rather a user or @
searchWord1 <- "archillinks"
searchWord2 <- "xtrs84zk"

# word1
word1_tweets = userTimeline(searchWord1, n = 10)

# word2
word2_tweets = userTimeline(searchWord2, n = 10)

#extrayendo el texto
word1_txt = sapply(word1_tweets, function(x) x$getText())
word2_txt = sapply(word2_tweets, function(x) x$getText())

##Cargando función de limpieza de Tweets
source("cleanRawTweets.R")


#limpiando el texto
word1_clean = clean.text(word1_txt)
word2_clean = clean.text(word2_txt)

#construyendo vectores
word1 = paste(word1_clean, collapse = " ")
word2 = paste(word2_clean, collapse = " ")

#unificando vectores
all = c(word1, word2)

#remover palabras principales
all = removeWords(all, c(stopwords("english"), searchWord1, searchWord2))

# create corpus
corpus = Corpus(VectorSource(all))

# create term-document matrix
tdm = TermDocumentMatrix(corpus)

# convert as matrix
tdm = as.matrix(tdm)

# add column names
colnames(tdm) = c("searchWord1", "searchWord2")

# comparison cloud
comparison.cloud(tdm, random.order = FALSE,
colors = c("#FF0099", "#6600CC"),
title.size = 1.5, max.words = 500)