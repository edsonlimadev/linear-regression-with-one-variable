% O objetivo desse método é encontrar os thetas que melhor se ajustem aos dados, olhando para todos os dados em cada iteração...
% Para mais informações sobre a técnica recomendo essa leitura: http://www.onmyphd.com/?p=gradient.descent
% Estou utilizando o J_history para acompanhar se a técnica está funcionando corretamente
function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
	m = length(y);
	J_history = zeros(num_iters, 1);

	for iter = 1:num_iters
	    temp0 = theta(1) - alpha * (1/m) * sum(X * theta -y);
	    temp1 = theta(2) - alpha * (1/m) * sum((X * theta -y ).* X(:,2));
	    theta = [temp0; temp1];
	    J_history(iter) = computeCost(X, y, theta);
	end
end