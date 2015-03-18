## Task: Programming Assignment 2
## Caching implementation (usefull for heavy computations)

## Defining special matrix object wich can store cashe of inversed one

makeCacheMatrix <- function(x = matrix()) {
    im <- NULL
    set <- function(y) {
        x <<- y  ##from parent environments
        m <<- NULL
    }
    get <- function() x
    setInv <- function(x_im) im <<- x_im
    getInv <- function() im
	list(set = set, get = get,
		setInv = setInv,
		getInv = getInv)

    
}


## Gets inversed matrix (either from cache or computes & caches for further needs)

cacheSolve <- function(x, ...) {
    
    im <- x$getInv()
    if(!is.null(im)) {
        message("getting cached data")
        im
    }
    im <- solve(x$get(), ...)
    x$setInv(im)
    im
}
