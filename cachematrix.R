## Write a short comment describing this function
#So this function takes a matrix as an argument and defines 2 other functions.
#setinverse and getinverse. setinverse applies solve to the matrix and returns
#the inverse and getinverse retrieves the stored matrix.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
  }


## Write a short comment describing this function
#get retireves the cached matrix if any, and if not, setinverse caches the 
#inverse.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached inverse matrix")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
  ## Return a matrix that is the inverse of 'x'
}
