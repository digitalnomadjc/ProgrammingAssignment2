## makeCache() will compute the inverse of a matrix
## cacheSolve will return the inverse of a matrix and used a cached result if has already
## been calculated

## This function implements two functions so that cacheSolve() can use it
## can use it to invert a matrix and to get the cached result of a matrix
## Assumption: 
## The matrix is always invertible

makeCacheMatrix <- function(x = matrix()) {
  
  ## Initialise the result to NULL for testing if the matrix
  ## has already been inverted
  matrixInverse <- NULL
  
  ## This function gets the calculated inverse if it exists.
  ## if not it will return NULL
  
  getInverse <- function(y) {
    matrixInverse
  }
  
  ## This function inverts the matrix and also stores a copy
  ## of the matrix to be inverted so we can detect changes in the
  ## matrix later for cachSolve
  
  inverse <- function(y) {
    computedMatrix <<- x
    matrixInverse <<- solve(y)
  }
  
  ## list at the end to allow access to functions
  list(getInverse = getInverse, inverse = inverse)
}


## This function will attempt obtain the cached inversion of a matrix if
## it exists or call makeCacheMatrix() to calculate the inverse.
## Assumption: 
## The matrix is always invertible

cacheSolve <- function(x, ...) {
        
  ## Return a matrix that is the inverse of 'x'
  
  ## get the Inverse of x if it exists
  m <- x$getInverse()
  
  ## Test to see if matrix inverse has already been calculated AND that the matrix
  ## has not changed, otherwise calculate the inverse

  if(!is.null(m) && x == computedMatrix ) {
    m
  } else {
    ## solve will invert the matrix for us
    x$inverse()
  }
}
