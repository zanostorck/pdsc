% Lab5
% Definição de constantes

K = 100; % 100 N.m
M1 = 1; %1kg
M2 = 1.5; %1.5kg
D_M = 52; %52 N.s/m

A = [0 1 0 0;(-K/M1) (-D_M/M1) (K/M1) 0;0 0 0 1;(K/M2) 0 (-K/M2) 0];
B = [0;0;0;(1/M2)];
C = [0 0 0 1];
D = 0;

erro = y(:,2) - y(:,4);

% Plot das respostas de ambos os sistemas
figure;
bgScale = 0.1;
whitebg([bgScale bgScale bgScale])
hold on;
grid on;
plot(tout,y(:,2),'cyan');    % State-space
plot(tout,y(:,3),'yellow');   % Step
plot(tout,y(:,4),'red');     % Fluxo
plot(tout,erro,'green');     % Erro

legend('Space-state','Step','Fluxo de sinais','Erro entre SS e Fluxo');

figure
bgScale = 0.1;
whitebg([bgScale bgScale bgScale])
hold on;
grid on;
plot(tout,erro,'green','DisplayName','Erro entre SS e Fluxo');     % Erro

legend('Erro entre SS e Fluxo');
