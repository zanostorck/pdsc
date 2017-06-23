% PSC - Lab8

%-------------------------------
% Definição do espaço de estados
%-------------------------------
A = [0 4 2;0 0 2;6 2 3];
B = [3;0;0];
C = [4 1 2];
D = 0;

%-------------------------------
% Definição ganhos relimentação
%-------------------------------
K1 = 9;
K2 = 11;
K3 = 14.5;
K_calculado = [K1 K2 K3];

K = place(A,B,[-10 -12 -2]);

% Plot das respostas de ambos os sistemas
figure;
bgScale = 0.1;
whitebg([bgScale bgScale bgScale])
hold on; grid on;

%plot(tout,y(:,2),'cyan');      % No Feedback State-space
plot(tout,y(:,3),'green');       % Feedback Space-state
plot(tout,y(:,4),'yellow');     % Step
legend('Feedback Space-state','Step');


