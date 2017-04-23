% Laboratorio 3: TURMA 480
% Projeto de Compensadores de Atraso de Fase no Matlab
% Requisitos: Max. sobressinal = 25% e Erro a rampa <= 8*10^-4
clc;
clear;
Kkv = 48.82;
% Define a variavel s e a Função de transferência como uma expressão racional
s = tf('s');
G = ((s+1.1)*(s+3))/(s*(s+0.3)*(s+0.7)*(s+0.5));

% Diagrama de Bode de G
bode(G); hold; bode(Kkv * G, {1*10^-3, 1*10^4} ); grid on; legend('G','Kkv*G');

% A partir do bode, obtemos:
% W0db = 1.52 rad/s
% W180db = 0.372 rad/s
% Margem de fase = 180 - 225 = -45º
% Margem de ganho = 0-32 = -32db
% Kv = 25.6

% Ganho Kkv necessário para satisfazer constante de velocidade desejada: 
% 1/Kv = 0.039 | Kkv = 1/0.008 = 1250 -> Kkv/Kv =  




