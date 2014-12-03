%% Inicializando
clear ; close all; clc

% Carregando o dataset
data = load('../data/data.csv');
X = data(:, 1);
y = data(:, 2);
m = length(y);

% Plotando os dados na tela
plotData(X, y);
fprintf('Aperte a tecla ENTER para continuar ...\n');
pause;

% Rodando o Gradiente Descendente
fprintf('Rodando o Gradiente Descendente ...\n');

X = [ones(m, 1), data(:,1)]; % Adiciono uma coluna com 1, para que eu possa fazer a multiplicação das matrizes
theta = zeros(2, 1); % Inicializo os thetas com zero

% Configurações do Gradiente Descendente
iterations = 1500;
alpha = 0.01;

% Executo o Gradiente Descendente para encontrar os Thetas
theta = gradientDescent(X, y, theta, alpha, iterations);

% Salvando os últimos thetas encontrados
csvwrite('../data/theta.csv', theta);

fprintf('Thetas encontrados pelo Gradiente Descendente: ');
fprintf('%f %f \n', theta(1), theta(2));
% Exibo na tela os Thetas encontrados

% Plotando o ajuste linear na tela
hold on; % Manter o gráfico anterior visível
plot(X(:,2), X*theta, '-');
legend('Conjunto de Treino', 'Regressão Linear');
hold off % Não iremos mais plotar nada nesse gráfico

fprintf('Aperte a tecla ENTER para continuar ...\n');
pause;

% Predizendo o lucro para populações de 35.000 e 70.000 habitantes
predict1 = [1, 3.5] * theta;
predict2 = [1, 7]   * theta;
fprintf('Para uma População de 35.000, nós predizemos um lucro de %f\n',...
        predict1*10000);
fprintf('Para uma População de 70,000, nós predizemos um lucro de %f\n',...
        predict2*10000);

%% ============= Visualizando a função de custo J(theta_0, theta_1) =============
fprintf('Visualizando a função de custo J(theta_0, theta_1) ...\n');

% Grid sobre o qual vamos calcular J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% Inicializando J_vals com uma matrix de zeros
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Preenchendo J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = computeCost(X, y, t);
    end
end

% Precisamos transpor a Matriz para usarmos o método surf
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals);
xlabel('\theta_0'); ylabel('\theta_1');

% Contour plot
figure;
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20));
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
