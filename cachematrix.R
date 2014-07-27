# AUTHOR: Richard Hoska
# DESCRIPTION: Coursera R Programming - Week 3 Assignment 2
#   Matrix inversion is usually a costly computation and there may be some benefit to 
#   caching the inverse of a matrix rather than computing it repeatedly (there are also 
#   alternatives to matrix inversion that we will not discuss here). Your assignment is to 
#   write a pair of functions that cache the inverse of a matrix.
# DATE: July 27 2014


##  This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  
  #--- CREATE variable to store the cached inverse matrix
  inv <- NULL
  
  #--- GETTER for matrix
  get <- function() x
  
  #--- SETTER for matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  #--- SETTER for inverse
  setinv <- function(inverse) inv <<- inverse
  
  #--- GETTER for inverse
  getinv <- function() inv
  
  #--- RETURN matrix with newly defined functions
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}

##  This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##    If the inverse has already been calculated (and the matrix has not changed), then cacheSolve 
##    should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  
  #--- 
  inv <- x$getinv()
  
  #--- CHECK to see if inverse has already been calculated
  if (!is.null(inv)) {
    
    #--- OUTPUT a message to effect debugging 
    message("getting cached data")
    
    #--- IF SO RETURN it
    return(inv)
  }
  else
  {
    #--- OUTPUT a message to effect debugging
    message("caching data")
    
    # The inverse is not yet calculated, so we calculate it
    data <- x$get()
    inv <- solve(data, ...)
    
    #--- CACHE the inverse
    x$setinv(inv)
    
    #--- RETURN inverse 
    return(inv)
  } 
}