setwd('C:/Users/suraj/Documents/Coursera-R')

# Function to create a cache matrix object
makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  s <- NULL
  
  # Function to set the value of the matrix
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  
  # Function to get the value of the matrix
  get <- function() x
  
  # Function to set the solved value of the matrix
  setsolve <- function(solve) s <<- solve
  
  # Function to get the solved value of the matrix
  getsolve <- function() s
  
  # Return a list of functions
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

# Function to solve the matrix and cache the result
cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  
  # If a solved value exists in the cache, return it
  if (!is.null(s)) {
    message("getting inversed matrix")
    return(s)
  }
  
  # If no solved value is found, solve the matrix
  data <- x$get()
  s <- solve(data, ...)
  
  # Cache the solved value
  x$setsolve(s)
  s
}
