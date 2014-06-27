complete <- function(directory, id = 1:332) {
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  # add one or two zeros to ID so that they match the CSV file names
  filenames <- sprintf("%03d.csv", id)
  
  # path to specdata folder
  # if no path is provided, default is working directory
  filenames <- paste(directory, filenames, sep="/")
  average <- rep(0,length(filenames))
  for(i in 1:length(filenames)){
    dataset <- read.csv(filenames[i],header=T)
    dataset2<-dataset["sulfate"]
    dataset3<-dataset["nitrate"]
    
    average[i]<-sum(!is.na(dataset3)&!is.na(dataset2))
    
  }
  
  my_data<-data.frame(id,average)
  cnames<-c("id","nobs")
  rnames<-1:length(id)
  colnames(my_data)<-cnames
  rownames(my_data)<-rnames
  
  my_data
  
}