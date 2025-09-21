clear;
close all;

vetTi = [1/eps 10 1 0.1];
vetKp = [0.5 1 2 10];

for i = 1:4
    Ti = vetTi(i);
    figure(i)
    hold on
    for j = 1:4
        Kp = vetKp(j);
        dados = sim('Tf.slx');
        subplot(2,2,j)
        plot(dados.tout, dados.out.Data)
    end
end

for i = 1:4
    Kp = vetKp(i);
    figure(4+i)
    hold on
    for j = 1:4
        Ti = vetTi(j);
        dados = sim('Tf.slx');
        subplot(2,2,j)
        plot(dados.tout, dados.out.Data)
    end
end