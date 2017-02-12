cat("\014")
setwd("~/Desktop/gilmore-charts")

sourceFolder <- function(folderName, verbose=FALSE, showWarnings=TRUE) {
  files <- list.files(folderName, full.names=TRUE)
  files <- files[grep("\\.txt$", files)]
  return(files)
}

readFileToDF <- function(fileName) {
  file <- file(fileName, open='r')
  
  res <- readLines(file);
  res <- res[res != ""]

  speaker <- gsub( ":.+", "", res)
  speaker <- gsub( "(\\[|\\().*(\\]|\\))", "", speaker)
  speaker <- gsub( "(OPEN|CUT|THE END).*", "", speaker)

  words <- gsub(".+:", "", res)

  parsed <- data.frame(speaker, words)
  parsed$episode <- fileName
  close(file)
  return(parsed)
}

createDataFrameFromFolder <- function(folderName) {
  fileNames <- sourceFolder(folderName)
  seasonAllLines <- data.frame(speaker=character(), words=character())
  for (i in fileNames) {
    fileLines <- readFileToDF(i)
    seasonAllLines <- rbind(seasonAllLines, fileLines)
  }
  return(seasonAllLines)
}

allDF <- createDataFrameFromFolder('raw')
# pars1 <- readFileToDF('raw/s01e21.txt')
