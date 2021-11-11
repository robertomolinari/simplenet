
# This is a fake vignette

We are simply testing a package for a very basic neural net

``` r
library(simplenet)
set.seed(1)
gender <- sample(c(0,1), size = 100, replace = TRUE) # x1 (input)
age <- round(runif(100, 18, 80)) # x2 (input)
xb <- 3.5*gender + 0.2*age - 9 # w1*x1 + w2*xw + b
p <- 1/(1 + exp(-xb))
y <- rbinom(n = 100, size = 1, prob = p) # output
neural_net(y, cbind(gender, age))
```

    ## [1]   881.77986    42.63734 -1883.78980
