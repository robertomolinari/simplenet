# Sigmoid function (activation function)
sigmoid <- function(z) {

  return(1 / (1 + exp(-z)))

}

# Loss function (quadratic) to find the parameter vector (weights and biases) of the neural net. In the loss function we are collecting the values of weights and bias into one vector: theta = c(w1, w2, b)
loss_net <- function(theta, y, X) {

  X_net <- cbind(X, rep(1, dim(X)[1])) # adding a column of ones to estimate the bias "b" (third element of the vector theta)
  obj <- sum((y - sigmoid(X_net%*%theta))^2)

  return(obj)

}

#' @title Simple neural net
#'
#' @description Compute a simple neural net
#' @param y the binary response variable
#' @return estimated weights
#' @author Rob Molinari
#' @export
#' @examples
#' set.seed(1)
#' gender <- sample(c(0,1), size = 100, replace = TRUE) # x1 (input)
#' age <- round(runif(100, 18, 80)) # x2 (input)
#' xb <- 3.5*gender + 0.2*age - 9 # w1*x1 + w2*xw + b
#' p <- 1/(1 + exp(-xb))
#' y <- rbinom(n = 100, size = 1, prob = p) # output
#' neural_net(y, cbind(gender, age))
neural_net <- function(y, X, init.val = rep(0, dim(X)[2] + 1)) {

  fit <- optim(par = init.val, fn = loss_net, y = y, X = X)

  return(fit$par)

}
