% Laboratorio 3: TURMA 480
% Projeto de Compensadores de Atraso de Fase no Matlab
% Nome: Matheus Storck
% Requisitos: Max. sobressinal = 25% e Erro a rampa <= 8*10^-4
clc;
clear;
e_req = 0.0008;

% 1. Modele o sistemas G(s) no Matlab, utilizando a funcao tf
%   Define a variavel s e a Função de transferência como uma expressão racional
    s = tf('s');
    G = ((s+1.1)*(s+3))/(s*(s+0.3)*(s+0.7)*(s+0.5));
% 2. Gere o diagrama de Bode de G(s) atraves da funcao bode(G); grid on;
%   Sera gerado no final do arquivo
% 3. Utilizando o diagrama de bode: obtenha a frequencia W0dB, W180, margem de fase, a margem de ganho do sistema
%   A partir do bode de G(s), obtemos:
%   W0db = 1.52 rad/s
%   W180 = 0.372 rad/s
%   Margem de fase = 180 - 225 = -45º
%   Margem de ganho = 0-32 = -32db
% 4. Utilizando o diagrama de bode: qual o Kv atual do sistema?
    Kv = 25.6; % Tracei uma reta com decaimento 20db e em 25.6 rad/s ela
%   cruzou o 0db, o que torna 25.6 equivalente ao Kv.

% 5. Calcule o ganho Kkv necessario para satisfazer a constante de velocidade desejada Kv* 
    Kv_req = 1/e_req;
    Kkv = Kv_req/Kv;
    disp(Kv_req);
    disp(Kkv);

% 6. Gerar o diagrama de bode de Kkv*G(s):
    % Sera gerado ao final do arquivo
% 7. Utilizando o diagrama de bode: obtenha a nova margem de fase e a nova margem de ganho do sistema com Kkv;     
%   A partir do novo bode (Kkv * G(s)), obtemos:
%   W0db = 7.28 rad/s
%   W180 = 0.372 rad/s
%   Margem de fase = 180 - 199 = -19º
%   Margem de ganho = 0-65.9 = -65.9db

% 8. O sistema e est´avel ou inst´avel? Explique utilizando o diagrama de bode gerado
%   O sistema e instavel pois a margem de fase continua negativa.

% 9. Utilizando o grafico apresentado na ultima pagina desta tarefa (Figura1) e o maximo sobre sinal desejado MP , encontre o coeficiente de amortecimento desejado e a margem de fase desejada
%   Pelo grafico da figura 1, foi possivel verificar que para Mp = 25%, temos
%   Qsi de aproximadamente 0.4 e Margem de fase de 43 graus. Realizando o
%   calculo de -180 + 43 + 5 foi obtido a fase de -132  graus, a qual
%   corresponde a frequencia de Wc de 0,14 no bode. A partir desta frequencia, foi
%   calculado o modulo de G(jw), de forma a obter o Kmp. O ganho necessario
%   para o que o sistema atinga a margem de fase de 43 graus foi calculado
%   fazendo Kmp_aux / Kkv previamente calculado.

    novo_wc = 0.138;
    novo_wc_2 = novo_wc^2;
    G_jw = (sqrt(novo_wc_2 + 1.1^2)*sqrt(novo_wc_2 + 3^2))/(novo_wc*(sqrt(novo_wc_2 + 0.3^2)*sqrt(novo_wc_2 + 0.7^2)*sqrt(novo_wc_2 + 0.5^2)));

    Ktemp = 1/G_jw;
% 10 e 11. Adicione 5 graus na margem de fase desejada:
    margem_desejada= 43+5; % = -132 
% 12. Qual o ganho (Kmp) necessario para atenuar a magnitude em wc e tornar esta frequencia a nova frequencia de !0dB, assim garantindo o maximo sobressinal desejado?
    
    Kmp= Ktemp/Kkv;

    %Obs: alternativamente, pode-se calcular Kmp atraves de:
    % Mag em 0.138 rad/s = 79,7db. Para que seja 0db, precisamos adicionar
    % -79,7db, portanto: 20log(x)=y --> 10^y/20 = x --> Kmp = 10^-79,7/20 =
    % 1,035x10^-4
    
% 13. Diagrama de bode de Kmp*Kkv*G(s) sera gerado no final
% 14. Utilizando o diagrama de bode: Qual o Kv,atual para o sistema Kmp·Kkv·G(s)?
    Kv_atual = 0.138; % W0db calculado anteriormente
% 15. Utilizando o Kvatual e o desejado calcule alpha = Kv/Kv,atual
    alpha = 1250/Kv_atual;
% 16. Posicione o zeroatraso uma decada abaixo da nova frequencia de
% cruzamento wc
    Zat = novo_wc/10;
% 17. Calcule o polo do compensador de atraso: poloatraso = zeroatraso/alpha
    Pat = Zat/alpha;
% 18. Determine o ganho do compensador Katraso para que o ganho DC do compensador C(s) seja 1. 
    Kat = Pat/Zat;
% 19. Defina o compensador
    C = Kat * ((s+Zat)/(s+Pat));

% 20. Diagrama de Bode de G, KKv*G, Kmp* Kkv*G e C*Kmp*Kkv*G
bode(G); hold; bode(Kkv * G, {1*10^-9, 1*10^9} ); bode(Kmp * Kkv * G); bode(C * Kkv * G); grid on; legend('G','Kkv*G','Kmp*Kkv*G','Cat*Kkv*G');


figure
s=tf([1 0],[0 1]);
%Fecha a malha com realimenta¸c~ao igual a 1
T = feedback(G,1);
% Testa o sistema com um sinal a Rampa do sistema original
%step(T/s,150)
%hold
Tc = feedback(C*Kkv*G,1);
hold
step(Tc/s,150);
plot([0 150],[0 150],'--k');
legend('C(s)*G(s)');
%legend(C(s)*G(s)')


figure
%Fecha a malha com realimentaçao igual a 1
T = feedback(G,1);
step(T,150);
hold
Tc = feedback(C*Kkv*G,1);
hold
step(Tc,150);
legend('C(s)*G(s)');
%legend(’C(s)*G(s)’)
