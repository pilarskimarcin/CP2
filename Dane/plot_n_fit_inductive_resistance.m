load ml_sensor.mat

Distance_m = SensorData.Distance_m;
Inductive_resistance_mH = SensorData.Inductive_resistance_mH;

figure("Position",[100, 200, 600, 450])
plot(SensorData.Sensor_V(end:-1:1), Distance_m(end:-1:1))
grid on
xlabel("Voltage from the sensor [V]")
ylabel("Distance from the electromagnet [m]")

figure("Position", [800, 200, 600, 450])
plot(Distance_m(end:-1:1), Inductive_resistance_mH(end:-1:1))
grid on
xlabel("Distance from the electromagnet [m]")
ylabel("Inductive resistance [mH]")

%% Fitting an exponential function to the inductive resistance vs distance
[fitresult, gof] = createFit(Distance_m, Inductive_resistance_mH);
RMSE = gof.rmse;
a = round(fitresult.a, 2)
b = round(fitresult.b, 2)
c = round(fitresult.c, 2)
d = round(fitresult.d, 2)
%% Derivatives of the fitted function
zz = linspace(Distance_m(1), Distance_m(end), 1000);
[deriv1, deriv2] = differentiate(fitresult, zz);

figure("Position",[100, 200, 600, 450])
plot(zz, deriv1)
grid on
xlabel("Distance from the electromagnet [m]")
ylabel("First derivative")

figure("Position", [800, 200, 600, 450])
plot(zz, deriv2)
grid on
xlabel("Distance from the electromagnet [m]")
ylabel("Second derivative")


