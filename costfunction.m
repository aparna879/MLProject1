function [J, grad] = costFunctionReg(theta, X, y, lambda)
  m = length(y);
  
  J = 0;
  grad = zeros(size(theta));
  
  predictions =  sigmoid(X*theta);

  leftPart = -y' * log(predictions);

  rightPart = (1 - y') * log(1 - predictions);

  thetaZero = theta;

  thetaZero(1) = 0;

  lambaCostPart = (lambda / (2 * m)) * sum(thetaZero .^ 2);

  lambdaGradPart = lambda / m * thetaZero;

  J = (1 / m) * (leftPart - rightPart) + lambaCostPart;

  grad = ((1/m) * (X' * (predictions - y))) + lambdaGradPart;
  
  end;

  
  
