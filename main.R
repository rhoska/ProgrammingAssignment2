# AUTHOR: Richard Hoska
# DESCRIPTION: Coursera R Programming - Week 3 Assignment 2
#   Demonstrates and tests the functions created in cachematrix.R
# DATE: July 27 2014

#--- INCLUDE the source
source(file="cachematrix.R")

#--- CREATE matrix for testing
x = rbind(c(1, -1/4), c(-1/4, 1))
m = makeCacheMatrix(x)
m$get()

#--- TEST WITHOUT cache
cacheSolve(m)

#--- TEST WITH cache
cacheSolve(m)