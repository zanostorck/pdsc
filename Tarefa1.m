%Plot Resposta ao degrau (1) + Referencia (3) - 1 = tout = tempo
%plot(tout, y(:,2),tout,y(:,3));
%REVISAR KP
Start = 1;
L = 1.03 - Start;
T = 1.21 - L - Start;
K = 0.02;
Kkp = T/L;
Kp = Kkp/K;

plot(tout, y(:,2),tout,y(:,3));
grid on;



