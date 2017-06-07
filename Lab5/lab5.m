% Lab5
% Define variaveis do workspace

K = 100; % 100 N.m
M1 = 1; %1kg
M2 = 1.5; %1.5kg
D_M = 52; %52 N.s/m

A = [0 1 0 0;(-K/M1) (-D_M/M1) (K/M1) 0;0 0 0 1;(K/M2) 0 (-K/M2) 0];
B = [0;0;0;(1/M2)];
C = [0 0 0 1];
D = [0];

erro = y(:,2) - y(:,4);

% Plot das respostas de ambos os sistemas
bgScale = 0.1;
whitebg([bgScale bgScale bgScale])
hold on;
grid on;
plot(tout,y(:,2),'cyan','DisplayName','Space-state');    % State-space
plot(tout,y(:,3),'yellow','DisplayName','Step');   % Step
plot(tout,y(:,4),'red','DisplayName','Fluxo');     % Fluxo
plot(tout,erro,'green','DisplayName','Erro entre SS e Fluxo');     % Erro
