clean.text <- function(textToBeCleaned) {
  textToBeCleaned = gsub("(RT|via)((?:\b\\W*@\\w+)+)", "", textToBeCleaned)
  textToBeCleaned = gsub("@\\w+", "", textToBeCleaned)
  textToBeCleaned = gsub("[[:punct:]]", "", textToBeCleaned)
  textToBeCleaned = gsub("[[:digit:]]", "", textToBeCleaned)
  textToBeCleaned = gsub("http\\w+", "", textToBeCleaned)
  textToBeCleaned = gsub("[ t]{2,}", "", textToBeCleaned)
  textToBeCleaned = gsub("^\\s+|\\s+$", "", textToBeCleaned)
  textToBeCleaned = gsub("amp", "", textToBeCleaned)
  # define "tolower error handling" function
  try.tolower = function(x) {
    y = NA
    try_error = tryCatch(tolower(x), error = function(e) e)
    if (!inherits(try_error, "error"))
      y = tolower(x)
    return(y)
  }
  textToBeCleaned = sapply(textToBeCleaned, try.tolower)
  textToBeCleaned = textToBeCleaned[textToBeCleaned != ""]
  names(textToBeCleaned) = NULL
  return(textToBeCleaned)
}
