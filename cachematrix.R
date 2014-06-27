## The first function which is called makeCacheMatrix creates a special 
## matrix, which is a list containing a function to set and get a value for 
## the matrix and then set and get the inverse value of the matrix
## 



makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(inv) m <<- inv
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)

}


## he second function is called cacheSolve and it first check if the inverse
## of the matrix is previously calculated (by checking the value of m) and
## if it has been evaluated before it prints "getting cached data" and 
## otherwise it calculates th inverse of the matrix and thenset the 
## value of the inversed matrix in cache and finally displays the inveresed 
## matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinv(m)
  m
}
