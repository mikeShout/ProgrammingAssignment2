
#The makeCacheMatrix function returns a list of functions that can be used by the cacheSolve function...
makeCacheMatrix <- function(aMatrix = matrix()) {
      
      # initiatie a variable that will return the inversed (solved) matrix
      inversedMatrix <- NULL 
      
      #The set function clears the variables across the makeCacheMatrix AND parent (cacheSolve) environments...
      set <- function(y) {
            aMatrix <<- y
            inversedMatrix <<- NULL
      }
      
      # returns the matrix to solve...
      get <- function() {
            aMatrix
      }
      
      #receives the inversed (solved) matrix and assigns it to the return variable...      
      setInvMatrix <- function(inverse) {
            inversedMatrix <<- inverse
      }
      
      # return the inversed (solved) matrix
      getInvMatrix <- function() {
            inversedMatrix     
      }
      
      #return a list of functions...
      list(set = set, get = get, setInvMatrix = setInvMatrix, getInvMatrix = getInvMatrix)
}

cacheSolve <- function(x){
      
      # Get the value of the inversed (solved) matrix. If it does not exist, then the value is NULL,
      # otherwuise it has a value and thus may have already been solved
      inversedMatrix <- x$getInvMatrix()
      
      # If the value is not NULL, then return this value and exit the function instead of 
      # proceeding to calculate the inversed matrix
      if(!is.null(inversedMatrix)) {
            message("There is a cached solution, so not re-running the calculation...")
            return(inversedMatrix)
      }
      
      # continuing to the steps below if the solved matrix is NULL...
      
      # Supply the matrix to be solved to the solve function using the get() funtcion...
      inversedMatrix <- solve(x$get())
      
      # assign the solution matrix to the inversedMatrix varaible so that is it no longer NULL
      # This will enable the next iteration to skip the calculation step 
      x$setInvMatrix(inversedMatrix)
      
      #return the answer...
      inversedMatrix
}
