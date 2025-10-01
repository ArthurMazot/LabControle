clear;
close all;

vetTi = [1/eps 10 1 0.1];
vetKp = [0.5 1 2 10];

for i = 1:4
    Ti = vetTi(i);
    if i == 1 %Se o Ti == 1/eps
        fig = figure(Name='grafico_Ti_inf', NumberTitle="off");
    else
        fig = figure(Name=strcat('grafico_Ti_', num2str(Ti)), NumberTitle="off"); %strcat concatena strings
    end
    for j = 1:4
        Kp = vetKp(j);
        dados = sim('Tf.slx');
        subplot(2,2,j) %coluna, linha, posição
        plot(dados.tout, dados.out.Data)
        hold on
        plot(dados.tout, dados.out1.Data) % Degrau
        hold on
        plot(dados.tout, dados.out2.Data) % ???
        hold on
        plot(dados.tout, dados.out3.Data) % ???
        title(strcat('Kp = ', num2str(Kp))) %titulo pra cada subplot
        legend('out', 'Degrau', '???', '???')

    end
    %Descomentar para salvar os graficos
    %if i == 1
    %    saveas(fig,strcat('grafico_Ti_inf.jpg'));
    %else
    %    saveas(fig,strcat('grafico_Ti_', num2str(Ti), '.jpg'));
    %end
end

for i = 1:4
    Kp = vetKp(i);
    fig = figure(Name=strcat('grafico_Kp_', num2str(Kp)), NumberTitle="off"); %strcat concatena strings
    for j = 1:4
        Ti = vetTi(j);
        dados = sim('Tf.slx');
        subplot(2,2,j) %coluna, linha, posição
        plot(dados.tout, dados.out.Data)
        hold on
        plot(dados.tout, dados.out1.Data) % Degrau
        hold on
        plot(dados.tout, dados.out2.Data) % ???
        hold on
        plot(dados.tout, dados.out3.Data) % ???
        legend('out', 'Degrau', '???', '???')
        if j == 1 %Se o Ti == 1/eps
            title('Ti = inf');
        else
            title(strcat('Ti = ', num2str(Ti))); %titulo pra cada subplot
        end
    end
    %Descomentar para salvar os graficos
    %saveas(fig, strcat('grafico_Kp_', num2str(Kp), '.jpg'));
end

%Mudar o Kp muda o ganho e a velocidade do sistema, maior o Kp maior a velocidade
%Um Kp grande pode afetar a estabilidade do sistema

%Mudar o Ti muda o ganho e o erro do sistema, maior o Ti menor o erro

%Um Ti pequeno pode afetar a estabilidade do sistema
