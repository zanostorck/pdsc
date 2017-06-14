% Lab 6 - Projetos de sistemas de controle

% Tarefa 1
A1 = [0 1 0;0 0 1;-11 -6 -13];
B1 = [0;0;3];
C1 = [1 0 0];
D1 = 0;

syms s;

sI = [s 0 0;0 s 0; 0 0 s];

aux = sI - A1;
aux = inv(aux);
aux = C1 * aux;
G1 = aux * B1;

erro1 = y(:,2) - y(:,3);

% Plot das respostas de ambos os sistemas
figure;
bgScale = 0.1;
whitebg([bgScale bgScale bgScale])
subplot(2,1,1);
hold on; grid on;

plot(tout,y(:,2),'cyan','DisplayName','Space-state');    % State-space
plot(tout,y(:,3),'yellow','DisplayName','TF');   % Step
plot(tout,erro1,'green','DisplayName','Erro entre SS e TF');     % Erro

subplot(2,1,2);
hold on; grid on;
plot(tout,erro1,'green','DisplayName','Erro entre SS e TF');     % Erro

% Tarefa 2

G2 = tf([12 2],[1 6 10 12 13]);

A2 = [0 1 0 0; 0 0 1 0; 0 0 0 1; -13 -12 -10 -6];
B2 = [0;0;0;1];
C2 = [2 12 0 0];
D2 = 0;

erro2 = y(:,5) - y(:,4);

figure;
bgScale = 0.1;
whitebg([bgScale bgScale bgScale])
subplot(2,1,1);
hold on; grid on;

plot(tout,y(:,4),'cyan','DisplayName','TF');    % State-space
plot(tout,y(:,5),'yellow','DisplayName','Space-state');   % Step
plot(tout,erro2,'green','DisplayName','Erro entre SS e TF');     % Erro

subplot(2,1,2);
hold on; grid on;
plot(tout,erro2,'green','DisplayName','Erro entre SS e TF');     % Erro


% Tarefa 3

[b1 a1] = ss2tf(A1, B1, C1, D1);

[A3, B3, C3, D3] = tf2ss([12 2],[1 6 10 12 13]);

disp('---------------------------------');
disp('FT da tarefa 1 calculada');
disp('---------------------------------');

disp(G1);

disp('---------------------------------');
disp('FT da tarefa 1 utilizando ss2tf');
disp('---------------------------------');

G3 = tf(b1,a1)

disp('---------------------------------');
disp('SS da tarefa 2 calculada');
disp('---------------------------------');

disp(A2);
disp(B2);
disp(C2);
disp(D2);

disp('---------------------------------');
disp('SS da tarefa 2 utilizando tf2ss');
disp('---------------------------------');

disp(A3);
disp(B3);
disp(C3);
disp(D3);
