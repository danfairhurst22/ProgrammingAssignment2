makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y){
	x <<- y
	m <<- NULL
}
get <- function() x
setinverse <- function(Solve) m <<- Solve
getinverse <- function() m
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}
cacheSolve <- function(x, ...) {
inverse <- x$getinverse()
	if(!is.null(inverse)){
		message("Getting cashed data")
		return(inverse)
}
	data <- x$get()
	m <- solve(data, ...)
	x$setinverse(m)
	m
}