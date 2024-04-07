% Trzeba najpierw mieæ dane MLExpData z obiektu
end_time = 1500;
figure
for i = 1:4
    subplot(4, 1, i)
    plot(MLExpData.time(1:end_time), MLExpData.signals(i).values(1:end_time))
    sim('model_sterowania2015a');
    grid on
    hold on
    plot(out.time, out.signals(i).values)
    legend('obiekt', 'model');
    title(MLExpData.signals(i).label);
    hold off
end