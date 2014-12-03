% Cálcula o custo de utilizar theta como parâmetro para a regressão linear
function J = computeCost(X, y, theta)
    m = length(y);
    J = (1/(2*m)) * sum((X * theta -y).^2);
end
