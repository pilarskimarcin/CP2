% % Inicjalizacja parametrów pocz¹tkowych
% initialParameters = 9;
% 
% load('Dane z zajêæ/Dane2/testokresu1.mat');
% out_obiekt = P1_ExpData;
% start = 750;
% time_obiekt = out_obiekt.time(start:end)-out_obiekt.time(start);
% stoptime = num2str(time_obiekt(end) - time_obiekt(start));
% pend_ang_obiekt = out_obiekt.signals(4).values(start:end) + pi;
% cost_fun_wrapper = @(params) cost_fun(params, stoptime, pend_ang_obiekt);
% 
% % Uruchom optymalizacjê
% optimalParameters = fminsearch(cost_fun_wrapper, initialParameters);
end_time = 85000;
figure
for i = 1:4
    subplot(4, 1, i)
    plot(MLExpData.time(1:end_time), MLExpData.signals(i).values(1:end_time))
    sim('model_sterowania2015a');
    grid on
    hold on
%     plot(out.time, out.signals(i).values)
%     legend('obiekt', 'model');
    xlabel('time [s]')
    ylabel(MLExpData.signals(i).label)
    hold off
end
