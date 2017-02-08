cat("\014")
setwd("~/Desktop/gilmore-charts")

sourceFolder <- function(folderName, verbose=FALSE, showWarnings=TRUE) {
  files <- list.files(folderName, full.names=TRUE)
  files <- files[grep("\\.txt$", files)]
  print(files)
}

formFile <- function(fileName) {
  file <- file(fileName, open='r')
  
  res <- readLines(file);
  res <- res[res != ""]

  speaker <- gsub( ":.+", "", res)
  speaker <- gsub( "\\[.*\\]", "", speaker)
  speaker <- gsub( "(OPEN|CUT|THE END).*", "", speaker)

  words <- gsub(".+:", "", res)

  parsed <- data.frame(speaker, words)
  
  close(file)
  return(parsed)
}

# sourceFolder('raw')
pars1 <- formFile('raw/s01e13.txt')
