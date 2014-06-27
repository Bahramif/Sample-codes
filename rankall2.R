rankall <- function(outcome, num = "best") {
  ## Read outcome data

## Check that state and outcome are valid
## For each state, find the hospital of the given rank
## Return a data frame with the hospital names and the
## (abbreviated) state name
  
  data2 <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  

 

  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
 

  outcomes = c("heart attack", "heart failure", "pneumonia")

  if(!any(outcomes==outcome))stop('invalid outcome')

  
  
  
  
  
  ##data2<-list.state[[i]]
  ## Obtain the information corresponding to the specified outcome  
  if(outcome == "heart attack"){
    
    
    hosp <- data2[!is.na(as.numeric(data2[ ,11])), ]
    out1 <- as.double(hosp[ ,11])
    hosp <- hosp[order(out1,hosp$Hospital.Name), ]

    list.state <- split(hosp,hosp$State)
    myAttempt <- sapply( list.state, function( myState ) {
      myHosp <- myState[,2]
      myState <- myState[,7]
        return(  data.frame(myHosp,myState) )
    } )
    ##hospital<-lapply(list.state, function(v) return(v[num]))
    hospital<-myAttempt[1,]
    state<-names(hospital)

    hospital2<-character(length(hospital))
    
    if (num=="best")  num<-1
    else if(num=="worst") {
      num<-length(hospital[[1]])
    }
    
    for (i in 1:length(hospital)){
      hospital2[i]<-as.character(hospital[[i]][num])
      state2<-state[[i]]
    }
    dataframe<-data.frame(hospital2,state)
  }
  
  
  
  
  
  if(outcome == "heart failure"){
    
    hosp <- data2[!is.na(as.numeric(data2[ ,17])), ]
    out1 <- as.double(hosp[ ,17])
    hosp <- hosp[order(out1,hosp$Hospital.Name), ]
    
    list.state <- split(hosp,hosp$State)
    myAttempt <- sapply( list.state, function( myState ) {
      myHosp <- myState[,2]
      myState <- myState[,7]
      return(  data.frame(myHosp,myState) )
    } )
    ##hospital<-lapply(list.state, function(v) return(v[num]))
    hospital<-myAttempt[1,]
    state<-names(hospital)
    
    hospital2<-character(length(hospital))
    
    if (num=="best")  num<-1
    else if(num=="worst") {
      num<-length(hospital[[1]])
    }
    
    for (i in 1:length(hospital)){
      hospital2[i]<-as.character(hospital[[i]][num])
      state2<-state[[i]]
    }
    dataframe<-data.frame(hospital2,state)
  }
  
  
  
  
  
  
  if(outcome == "pneumonia"){
    hosp <- data2[!is.na(as.numeric(data2[ ,23])), ]
    out1 <- as.double(hosp[ ,23])
    hosp <- hosp[order(out1,hosp$Hospital.Name), ]
    
    list.state <- split(hosp,hosp$State)
    myAttempt <- sapply( list.state, function( myState ) {
      myHosp <- myState[,2]
      myState <- myState[,7]
      return(  data.frame(myHosp,myState) )
    } )
    ##hospital<-lapply(list.state, function(v) return(v[num]))
    hospital<-myAttempt[1,]
    state<-names(hospital)
    
    hospital2<-character(length(hospital))
    
    if (num=="best")  num<-1
    else if(num=="worst") {
      num<-length(hospital[[1]])
    }
    
    for (i in 1:length(hospital)){
      hospital2[i]<-as.character(hospital[[i]][num])
      state2<-state[[i]]
    }
    dataframe<-data.frame(hospital2,state)
  }
  
 dataframe 
}





