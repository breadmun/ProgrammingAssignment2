## Put comments here that give an overall description of what your
## functions do

## The functions store a matrix and it's inverse (if it's been calculated), and return 
## the inverse, first checking to see if it's stored in the cache

## Write a short comment describing this function

## The first function takes a matrix as input, it sets the cached inverse to "Null" and
## returns a list of functions to set the matrix, get the matrix, set the inverse
## and get the inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) i <<- solve
  getinverse <- function() i
  list(set = set, get = get,
       setinverse =  setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## The second function checks to see if the "getinverse" function returns null, 
## if it doesn't it prints the message and returns the value
## if it does it calculates the inverse of the matrix returned from the "get" function
## stores it in the cache and returns the value


cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
          ## Return a matrix that is the inverse of 'x'
}
