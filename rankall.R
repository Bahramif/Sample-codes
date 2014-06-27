
## Ranking hospitals in all states

rankall <- function(outcome, num = "best") {
  
  ## read the data  
  data2 <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

  ## Check that state and outcome are valid
  outcomes = c("heart attack", "heart failure", "pneumonia")
  if(!any(outcomes==outcome))stop('invalid outcome')

  
  ## Obtain the information corresponding to the heart attack  
  if(outcome == "heart attack"){
    
  ## Sort based on the outcome in alphabetical order  
    hosp <- data2[!is.na(as.numeric(data2[ ,11])), ]
    out1 <- as.double(hosp[ ,11])
    hosp <- hosp[order(out1,hosp$Hospital.Name), ]

  ## split data in terms of the state names
    list.state <- split(hosp,hosp$State)
    myAttempt <- sapply( list.state, function( myState ) {
      myHosp <- myState[,2]
      myState <- myState[,7]
        return(  data.frame(myHosp,myState) )
    } )
    
  
  ## extracting the name of hospital and the corresponding state
    hospital<-myAttempt[1,]
    state<-names(hospital)
    hospital2<-character(length(hospital))
    
  ## Check the value of the num
  if (num=="best")  num<-1
    else if(num=="worst") {
      num<-length(hospital[[1]])
    }
  
  
  ## Extract the hotpital name and state corresponding to the value of num
    for (i in 1:length(hospital)){
      hospital2[i]<-as.character(hospital[[i]][num])
      state2<-state[[i]]
    }
  
  ## Display results in data.frame format
    dataframe<-data.frame(hospital=hospital2,state)
  }
  
  
  
  
  ## Obtain the information corresponding to the heart failure   
  if(outcome == "heart failure"){
    
    ## Sort based on the outcome in alphabetical order 
    hosp <- data2[!is.na(as.numeric(data2[ ,17])), ]
    out1 <- as.double(hosp[ ,17])
    hosp <- hosp[order(out1,hosp$Hospital.Name), ]
    
    ## split data in terms of the state names
    list.state <- split(hosp,hosp$State)
    myAttempt <- sapply( list.state, function( myState ) {
      myHosp <- myState[,2]
      myState <- myState[,7]
      return(  data.frame(myHosp,myState) )
    } )
    
    ## extracting the name of hospital and the corresponding state
    hospital<-myAttempt[1,]
    state<-names(hospital)
    hospital2<-character(length(hospital))
    
    ## Check the value of the num
    if (num=="best")  num<-1
    else if(num=="worst") {
      num<-length(hospital[[1]])
    }
    
    ## Extract the hotpital name and state corresponding to the value of num
    for (i in 1:length(hospital)){
      hospital2[i]<-as.character(hospital[[i]][num])
      state2<-state[[i]]
    }
    
    ## Display results in data.frame format
    dataframe<-data.frame(hospital=hospital2,state)
  }
  
  
  
  
  
  ## Obtain the information corresponding to the pneumonia
  if(outcome == "pneumonia"){
    
    ## Sort based on the outcome in alphabetical order 
    hosp <- data2[!is.na(as.numeric(data2[ ,23])), ]
    out1 <- as.double(hosp[ ,23])
    hosp <- hosp[order(out1,hosp$Hospital.Name), ]
    
    ## split data in terms of the state names
    list.state <- split(hosp,hosp$State)
    myAttempt <- sapply( list.state, function( myState ) {
      myHosp <- myState[,2]
      myState <- myState[,7]
      return(  data.frame(myHosp,myState) )
    } )
    
    ## extracting the name of hospital and the corresponding state
    hospital<-myAttempt[1,]
    state<-names(hospital)
    hospital2<-character(length(hospital))
    
    ## Check the value of the num
    if (num=="best")  num<-1
    else if(num=="worst") {
      num<-length(hospital[[1]])
    }
    
    ## Extract the hotpital name and state corresponding to the value of num
    for (i in 1:length(hospital)){
      hospital2[i]<-as.character(hospital[[i]][num])
      state2<-state[[i]]
    }
    
    ## Display results in data.frame format
    dataframe<-data.frame(hospital=hospital2,state)
  }
  
 dataframe 
}





