Sample-codes
============
1-best.R : Finding the best hospital in a state using outcome-of-care-measures.csv

2-rankhospital.R: takes three arguments: the 2-character abbreviated name of a state 
(state), an outcome (outcome), and the ranking of a hospital in that state for that 
outcome (num). The function reads the outcome-of-care-measures.csv file and returns 
a character vector with the name of the hospital that has the ranking specified by 
the num argument.

3-rankall.R: takes two arguments: an outcome name (outcome) and a hospital rank- ing (num). 
The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame 
containing the hospital in each state that has the ranking specified in num.

4-outcome-of-care-measures.csv: Contains information about 30-day mortality and 
readmission rates for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.

5-cachematrix.R: Caching the Inverse of a Matrix

6-complete.R: a function that reads a directory full of files and reports the number of 
completely observed cases in each data file.

7-corr.R: a function that takes a directory of data files and a threshold for complete 
cases and calculates the correlation between sulfate and nitrate for monitor locations 
where the number of completely observed cases (on all variables) is greater than the threshold.

8-pollutantmean.R :calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors

9-neural-net.R: simple neural network algorithm to calculate the square root of the input 

