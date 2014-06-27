pollutantmean <- function(directory= getwd(), pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  # add one or two zeros to ID so that they match the CSV file names
  filenames <- sprintf("%03d.csv", id)
  data = numeric()
  # path to specdata folder
  # if no path is provided, default is working directory
  filenames <- paste(directory, filenames, sep="/")
  average <- rep(0,length(filenames))
  # get the data from selected ID or IDs from the specified path
  for(i in 1:length(filenames)){
     dataset <- read.csv(filenames[i],header=T)
     dataset2<-dataset[pollutant]
     data<-c(data,dataset2[!is.na(dataset2)])
}
  mean(data)

  
  
}