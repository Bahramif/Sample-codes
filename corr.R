corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  id<-1:332
  ## Return a numeric vector of correlations
  filenames <- sprintf("%03d.csv", id)
  
  # path to specdata folder
  # if no path is provided, default is working directory
  filenames <- paste(directory, filenames, sep="/")
  cor2 <- rep(0,length(filenames))

  
  my_data<-complete("specdata", id)
  for(i in 1:length(filenames)){
    j<-1
    if(my_data[i,2]>threshold) {
      dataset <- read.csv(filenames[i],header=T)
      dataset2<-dataset["sulfate"]
      dataset3<-dataset["nitrate"]
      dataset22<-dataset2[!is.na(dataset3)&!is.na(dataset2)]
      
      dataset33<-dataset3[!is.na(dataset3)&!is.na(dataset2)]
      cor2[i]<-cor(dataset22,dataset33)
      
    }
    corr <- rep(0,sum(cor2!=0))
    corr<-cor2[cor2!=0]
  }
  
  
  corr
  
}