%% Metodo 1

Start = 1;
L = 1.024 - Start;
T = 1.196 - L - Start;
K = 0.02;
Kkp = T/L;
Kp = Kkp/K;

KpInt = 0.9 * (T/L);
Ti1 = L/0.3;

% 1 - tempo (tout)
% 2 - G(s) original
% 3 - Degrau unitario
% 4 - G(s)aprox baseada no T e L obtidos graficament
% 5 - Compensador P * G(s) - Ainda com erro ao degrau
% 6 - Compensador PI * G(s) - Sem erro ao degrau

bgScale = 0.1;
whitebg([bgScale bgScale bgScale])
hold on;
grid on;
plot(tout,y(:,2),'cyan');    % G(s)
plot(tout,y(:,3),'green');   % Degrau
plot(tout,y(:,4),'blue');    % G(s)aprox baseada no T e L obtidos graficamente
plot(tout,y(:,5),'yellow');  % Compensador P * G(s)
plot(tout,y(:,6),'magenta'); % Compensador PI * G(s)
 

%% Metodo 2
figure;
bgScale = 0.2;
whitebg([bgScale bgScale bgScale])
s = tf('s');
G = 300/((s+20)*(s+25)*(s+30));
subplot(2,1,1);
bode(G);
grid on;

% w0db = Não cruza 0db.
% w180 = 43 rad/s
% Margem de fase = Infinita
% Margem de ganho = 52.3
Gm = 52.3; %Em db
w180 = 43;

Kcrit = 10^(Gm/20);
Pcrit = (2*pi)/w180;

%Projeto do novo controlador PI:

KpInt2 = 0.45 * Kcrit;
Ti2 = (1/1.2) * Pcrit;
Td2 = 0;

subplot(2,1,2);
hold on;
grid on;
plot(tout,y(:,2),'white','DisplayName','G(s)','Color',[1 1 1]);    % G(s)
plot(tout,y(:,3),'green','DisplayName','Step','Color',[0 1 0]);   % Degrau
plot(tout,y(:,4),'blue','DisplayName','G(s) aprox','Color',[0 0 1]);    % G(s)aprox baseada no T e L obtidos graficamente
plot(tout,y(:,5),'yellow','DisplayName','M1 - P * G(s)','Color',[1 1 0]);  % Compensador P * G(s)
plot(tout,y(:,6),'magenta','DisplayName','M1 - PI * G(s)','Color',[1 0 1]); % Metodo 1 - Compensador PI * G(s)
plot(tout,y(:,7),'Cyan','DisplayName','M2 - PI * G(s)','Color',[0 1 1]); % Metodo 2 - Compensador PI * G(s)



