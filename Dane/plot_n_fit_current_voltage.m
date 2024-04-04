load Prad_vs_napiecie.mat

line_params = polyfit(U_pomiar, I_ref, 1);
figure
plot(U_pomiar, I_ref, "k*", U_pomiar, U_pomiar * line_params(1) + line_params(2), "r-")
grid on
xlabel("Voltage measurement [V]")
ylabel("Current measurement [A]")


I_R = [I_ref(1), I_ref(3), I_ref(5)];
U_R = [U_stacji(1), U_stacji(3), U_stacji(5)];
line_params = polyfit(I_R, U_R, 1);
figure
plot(I_R, U_R, "k*", I_R, I_R * line_params(1) + line_params(2), "r-")
grid on
% R = 4.38Ohm
title("Resistance calculation: R = " + num2str(line_params(1)) + "\Omega")
xlabel("Current measurement [A]")
ylabel("Voltage measurement [V]")


line_params = polyfit(u2, U_stacji, 1);
figure
plot(u2, U_stacji, "k*", u2, u2 * line_params(1) + line_params(2), "r-")
grid on
xlabel("Control value (PWM duty factor)")
ylabel("Voltage of the power station [V]")