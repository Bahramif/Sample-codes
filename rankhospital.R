best <- function(state, outcome) {
  ##a function called best that take two arguments: the 2-character 
  ## abbreviated name of a state and an outcome name. The function reads 
  ## the outcome-of-care-measures.csv file and returns a character vector 
  ## with the name of the hospital that has the best (i.e. lowest) 30-day 
  ## mortality for the specified outcome in that state. The hospital name 
  ## is the name provided in the Hospital.Name variable. The outcomes can 
  ## be one of “heart attack”, “heart failure”, or “pneumonia”. Hospitals 
  ## that do not have data on a particular outcome should be excluded from 
  ## the set of hospitals when deciding the rankings.
  
  ## Read outcome data
  data1 <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  outcomes = c("heart attack", "heart failure", "pneumonia")
  state_name<-as.character(data1[,7])
  
  if(!any(state_name==state))stop('invalid state')
 
  if(!any(outcomes==outcome))stop('invalid outcome')

  ## Obtain the information corresponding to the specified state 
  data2 <- (data1[data1$State == state, ])
  
  ## Obtain the information corresponding to the specified outcome  
  if(outcome == "heart attack"){
    hosp <- data2[!is.na(as.numeric(data2[ ,11])), ]
    out1 <- as.double(hosp[ ,11])
    hosp <- hosp[order(out1,hosp$Hospital.Name), ]
  }
  
  if(outcome == "heart failure"){
    hosp <- data2[!is.na(as.numeric(data2[ ,17])), ]
    out2 <- as.double(hosp[ ,17])
    hosp <- hosp[order(out2,hosp$Hospital.Name), ]
  }
  
  if(outcome == "pneumonia"){
    hosp <- data2[!is.na(as.numeric(data2[ ,23])), ]
    out3 <- as.double(hosp[ ,23])
    hosp <- hosp[order(out3,hosp$Hospital.Name), ]
  }
  
  hosp
  
}




## rank hospitals interms of their outcome
rankhospital<-function(state,outcome,num="best") {
 
  
  hosp<-best(state,outcome)
  hosp2<-hosp[,2]
  m<-length(hosp2)
  
  ## Check the value of the num
  if (num=="best")  num<-1
  else if(num=="worst") {
    num<-m
  }
  else if(num>m) ('NA')


  ## display the ranking
  hosp[num,2]
  
}