## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix is similar to makeVector (example function)
makeCacheMatrix <- function(x = matrix()) {
	#1. initialize x_inv to NULL. This stores inverse of x.
	x_inv <- NULL

	#2. set, get, setInverse, getInverse functions (similar to makeVector in example)
	set <- function(y) {
		x <<- y
		x_inv <<- NULL
	}
	get <- function() x
	setInverse <- function(invertedMatrix) x_inv <<- invertedMatrix
	getInverse <- function() x_inv 

	#3. set the list such that $ access (such as x$set, x$get) is provided.
	list(set = set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

	#1. check if inverse is already cached.
	x_inv <- x$getInverse()
	if(!is.null(x_inv)) {
		message("Getting cached data");
		return(x_inv)
	}

	#2. Calculate the inverse of the matrix (get the data and call solve)
	data <- x$get()
	x_inv <- solve(data,...)

	#3. Store the inverse of x
	x$setInverse(x_inv)

	#4. return the result
	x_inv	
}
