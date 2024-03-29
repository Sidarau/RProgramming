corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  files <- list.files(path = directory, full.names = TRUE)
  cr <- c()
  for (i in 1:length(files)) {
    data <- read.csv(files[i])
    cmpl <- sum(complete.cases(data))
    
    if (cmpl > threshold) {
      cmpl_data <- data[complete.cases(data), ]
      cr <- c(cr, cor(cmpl_data$sulfate, cmpl_data$nitrate))
    }
    
  }
 cr 
}