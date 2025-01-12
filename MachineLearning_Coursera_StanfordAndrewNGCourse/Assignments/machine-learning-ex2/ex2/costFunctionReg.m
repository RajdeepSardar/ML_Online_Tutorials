function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
h_theta_x = sigmoid(X * theta);
J = (1/m)  * sum(-y.*log(h_theta_x) - (1 -y).* log(1- h_theta_x)); % without regularization
grad_row_count = size(theta)(:,1);
for row = 2:grad_row_count
	J = J + (lambda/(2*m))*(theta(row)^2); 
	grad(row) = 1/m * sum((h_theta_x - y) .* X(:,row)) + (lambda/(m))*(theta(row)) ;
end
grad(1) =  1/m * sum((h_theta_x - y) .* X(:,1));

% =============================================================

end
