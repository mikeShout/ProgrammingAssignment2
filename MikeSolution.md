### Mike's Notes on R Programming Assignment #2


The R script I created heavily leverages the example scripts to produce the functions
required in addresing the R Programming assignment #2. 

Here are notes on how I used / tested the script...

1. Start with an invertible matrix such as, 
```{r}
> matrixToSolve <- matrix(c(2, 6, 4, 8), 2,2)
> matrixToSolve
     [,1] [,2]
[1,]    2    4
[2,]    6    8
> 
```

2. Establish the list of functions and set the matrix to be solved,
```{r}
> temp <- makeCacheMatrix(MatrixToSolve)
> temp$set(matrixToSolve)
> 
```

3. Run the cacheSolve function for the first time... It calculates and returns the answer...
```{r}
> cacheSolve(temp)
      [,1]  [,2]
[1,] -1.00  0.50
[2,]  0.75 -0.25
> 
```

4. Run the cacheSolve function a second time. It should indicate the answer is already cached...
```{r}
> cacheSolve(temp)
      [,1]  [,2]
[1,] -1.00  0.50
[2,]  0.75 -0.25
> cacheSolve(temp)
There is a cached solution, so not re-running the calculation...
      [,1]  [,2]
[1,] -1.00  0.50
[2,]  0.75 -0.25
> 
```

__The End.__

***