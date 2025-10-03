clear;
close all;

vetTi = [1/eps 10 1 0.1];
vetKp = [0.5 1 2 10];

for i = 1:4
    Ti = vetTi(i);
    
    % Criar a figura
    if i == 1
        fig = figure('Name', 'grafico_Ti_inf', 'NumberTitle', 'off');
    else
        fig = figure('Name', strcat('grafico_Ti_', num2str(Ti)), 'NumberTitle', 'off');
    end

    subplot(1,1,1); % ← fora do loop!
    hold on

    for j = 1:4
        Kp = vetKp(j);
        dados = sim('Tf.slx');
        plot(dados.tout, dados.out.Data, 'DisplayName', ['Kp = ', num2str(Kp)]);
    end

    if i == 1
        title('Ti = inf');
    else
        title(['Ti = ', num2str(Ti)]);
    end

    legend show
    if i == 4 
    xlim([0 10])
    ylim([0 5])
    else 
    xlim([0 10])
    ylim([0 2])
    end
    grid on
    hold off

    % Descomentar para salvar os graficos
    % if i == 1
    %     saveas(fig, 'grafico_Ti_inf.jpg');
    % else
    %     saveas(fig, strcat('grafico_Ti_', num2str(Ti), '.jpg'));
    % end
end

for i = 1:4
    Kp = vetKp(i);
    
    fig = figure('Name', strcat('grafico_Kp_', num2str(Kp)), 'NumberTitle', 'off');

    subplot(1,1,1);  % apenas um gráfico por figura
    hold on

    for j = 1:4
        Ti = vetTi(j);
        dados = sim('Tf.slx');

        % Definir nome da curva conforme Ti
        if j == 1
            label = 'Ti = inf';
        else
            label = ['Ti = ', num2str(Ti)];
        end

        % Plotar apenas a saída principal
        plot(dados.tout, dados.out.Data, 'DisplayName', label)
    end

    title(['Kp = ', num2str(Kp)]);
    legend show
    if i == 1 || i == 2
    xlim([0 10])
    ylim([0 2])
    end 

    if i == 3 || i == 4
    xlim([0 10])
    ylim([0 4])
    end 

    grid on
    hold off

    % Descomentar para salvar os graficos
    % saveas(fig, strcat('grafico_Kp_', num2str(Kp), '.jpg'));
end
%Mudar o Kp muda o ganho e a velocidade do sistema, maior o Kp maior a velocidade
%Um Kp grande pode afetar a estabilidade do sistema

%Mudar o Ti muda o ganho e o erro do sistema, maior o Ti menor o erro

%Um Ti pequeno pode afetar a estabilidade do sistema
