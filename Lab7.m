%---------------------------------
% Projetos de sistemas de controle
% Laboratório 7
% Matheus Zanini Storck
%---------------------------------
clc;
clear;

%---------------------------------
% Definição Sistema 1
%---------------------------------

A1 = [-4 8;3 5];
B1 = [1;0];
C1 = [1 2];

MC1 = ctrb(A1,B1);
MO1 = obsv(A1,C1);

rank(MC1);
rank(MO1);

%---------------------------------
% Definição Sistema 2
%---------------------------------

A2 = [0 0 0 1;0 0 4 2;4 3 0 0;6 0 0 12];
B2 = [0;2;0;0];
C2 = [3 3 5 6];

MC2 = ctrb(A2,B2);
MO2 = obsv(A2,C2);

rank(MC2);
rank(MO2);
