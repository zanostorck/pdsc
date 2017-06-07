% Lab5
% Define variaveis do workspace

K = 100; % 100 N.m
M1 = 1000; %1kg
M2 = 1500; %1.5kg
D = 52; %52 N.s/m

% Plot das respostas de ambos os sistemas
bgScale = 0.1;
whitebg([bgScale bgScale bgScale])
hold on;
grid on;
plot(tout,y(:,2),'cyan');    % G(s)
plot(tout,y(:,3),'green');   % Degrau