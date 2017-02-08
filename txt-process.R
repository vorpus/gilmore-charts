cat("\014")
setwd("~/Desktop/gilmore-charts")
file <- file('raw/s01e01.txt', open='r')

res <- readLines(file);
res <- res[res != ""]
speaker <- gsub( ":.+", "", res)
words <- gsub(".+:", "", res)
parsed <- data.frame(speaker, words, res)


# colnames(parsed) <- c('original')


close(file)

