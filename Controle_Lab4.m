%% Metodo 1
%Plot Resposta ao degrau (1) + Referencia (3) - 1 = tout = tempo
%plot(tout, y(:,2),tout,y(:,3));


Start = 1;
L = 1.024 - Start;
T = 1.196 - L - Start;
K = 0.02;
Kkp = T/L;
Kp = Kkp/K;

KpInt = 0.9 * (T/L);
Ti = L/0.3;

plot(tout, y(:,2),tout, y(:,3),tout, y(:,4),tout, y(:,5),tout, y(:,6));
grid on;

%% Metodo 2
s = tf('s');
G = 20000/((s+20)*(s+25)*(s+30));
bode(G);
grid on;


