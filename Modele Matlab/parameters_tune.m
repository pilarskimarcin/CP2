% Inicjalizacja parametrów początkowych
initialParameters = 9;

load('Dane z zajęć/Dane2/testokresu1.mat');
out_obiekt = P1_ExpData;
start = 750;
time_obiekt = out_obiekt.time(start:end)-out_obiekt.time(start);
stoptime = num2str(time_obiekt(end) - time_obiekt(start));
pend_ang_obiekt = out_obiekt.signals(4).values(start:end) + pi;
cost_fun_wrapper = @(params) cost_fun(params, stoptime, pend_ang_obiekt);

% Uruchom optymalizację
optimalParameters = fminsearch(cost_fun_wrapper, initialParameters);