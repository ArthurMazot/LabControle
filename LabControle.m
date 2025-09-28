clear;
close all;

vetTi = [1/eps 10 1 0.1];
vetKp = [0.5 1 2 10];

for i = 1:4
    Ti = vetTi(i);
    figure(Name=strcat('Ti = ', num2str(Ti)), NumberTitle="off"); %strcat concatena strings
    for j = 1:4
        Kp = vetKp(j);
        dados = sim('Tf.slx');
        subplot(2,2,j) %col, lin, pos
        plot(dados.tout, dados.out.Data)
        title(strcat('Kp = ', num2str(Kp))) %titulo pra cada subplot
    end
end

for i = 1:4
    Kp = vetKp(i);
    figure(Name=strcat('Kp = ', num2str(Kp)), NumberTitle="off"); %strcat concatena strings
    for j = 1:4
        Ti = vetTi(j);
        dados = sim('Tf.slx');
        subplot(2,2,j) %col, lin, pos
        plot(dados.tout, dados.out.Data)
        title(strcat('Ti = ', num2str(Ti))) %titulo pra cada subplot
    end
end

%Mudar o Kp muda o ganho e a velocidade do sistema, maior o Kp maior a velocidade
%Mudar o Ti muda o ganho e o erro do sistema, maior o Ti menor o erro