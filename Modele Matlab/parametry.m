%% Variables setup
m = 0.058; % [kg]
u_max = 12.28; % [V]
g = 9.81; % [m/s^2]
R = 4.38; % [Ohm]
% L(z) parameters: (L(z) - [mH], scaled in the model)
a = 27.62;
b = -304.84;
c = 112.75;
d = -2.74;

%% Initial conditions
z0 = 0.010; % [m]
z_max = 0.010; % [m]
v0 = 0.0; % [m/s]

sim_time = 1.5; % [s]
%% Old
% k1 = p1 / (m * l);
% k2 = (fc - p2) / (m * l);
% k3 = fp / (m * l);
% %% Regulator
% syms x1 x2 x3 x4 u
% % NASTAWY GORA
% A = jacobian([x2, ...
%     (Jp/(m*l)*(k1*u-x4^2*sin(x3)-k2*x2)+(g*sin(x3)-k3*x4)*cos(x3))/(Jp/(m*l^2)-cos(x2)^2), ...
%     x4, ...
%     ((k1*u-x4^2*sin(x3)-k2*x2)*cos(x3)+(g*sin(x3)-k3*x4)/l)/(Jp/(m*l^2)-cos(x2)^2)], [x1, x2, x3, x4]);
% A = double(subs(A, {x1, x2, x3, x4}, [0, 0, 0, 0]));
% B = jacobian([x2, ...
%     (Jp/(m*l)*(k1*u-x4^2*sin(x3)-k2*x2)+(g*sin(x3)-k3*x4)*cos(x3))/(Jp/(m*l^2)-cos(x2)^2), ...
%     x4, ...
%     ((k1*u-x4^2*sin(x3)-k2*x2)*cos(x3)+(g*sin(x3)-k3*x4)/l)/(Jp/(m*l^2)-cos(x2)^2)], u);
% 
% % NASTAWY DOL
% % A = jacobian([x2, ...
% %     (Jp/(m*l)*(k1*u-x4^2*sin(x3)-k2*x2)+(-g*sin(x3)-k3*x4)*cos(x3))/(Jp/(m*l^2)-cos(x2)^2), ...
% %     x4, ...
% %     ((k1*u-x4^2*sin(x3)-k2*x2)*cos(x3)+(-g*sin(x3)-k3*x4)/l)/(Jp/(m*l^2)-cos(x2)^2)], [x1, x2, x3, x4]);
% % A = double(subs(A, {x1, x2, x3, x4}, [0, 0, 0, 0]));
% % B = jacobian([x2, ...
% %     (Jp/(m*l)*(k1*u-x4^2*sin(x3)-k2*x2)+(-g*sin(x3)-k3*x4)*cos(x3))/(Jp/(m*l^2)-cos(x2)^2), ...
% %     x4, ...
% %     ((k1*u-x4^2*sin(x3)-k2*x2)*cos(x3)+(-g*sin(x3)-k3*x4)/l)/(Jp/(m*l^2)-cos(x2)^2)], u);
% 
% B = double(subs(B, {x1, x2, x3, x4}, [0, 0, 0, 0]));
% C = [1 0 0 0;
%     0 0 1 0];
% D = [0; 0];
% L = place(A', C', [-5, -15, -50, -6]);
% L = L';
% Q = [0.0685,0,0,0;
%     0,0,0,0;
%     0,0,0.25,0;
%     0,0,0,0];
% R = 1;
% K = lqr(A, B, Q, R);
% K(2) = K(2) * 0.8; %0.7
% K(4) = K(4) * 0.3; %0.2
% %% Initial conditions
% theta0 = pi/12;
% theta_prim0 = 0;
% y0 = 0;
% y_prim0 = 0;
% %% Simulation and results
% out = sim('InvPendulum_2022b.slx');
% time = out.tout;
% y = out.out.signals(1).values;
% y_prim = out.out.signals(2).values;
% theta = out.out.signals(3).values;
% theta_prim = out.out.signals(5).values;
% u = out.out.signals(6).values;
% 
% figure
% subplot(5, 1, 1)
% plot(time, u, "Color", "r"), hold off
% legend('control')
% ylabel("u [-]")
% xlabel("time [s]")
% subplot(5, 1, 2)
% plot(time, theta, "Color", 'c'), hold off
% legend('pend angle')
% ylabel("\theta [rad]")
% xlabel("time [s]")
% subplot(5, 1, 3)
% plot(time, theta_prim, "Color", 'c')
% legend('pend vel')
% ylabel("\omega [rad/s]")
% xlabel("time [s]")
% subplot(5, 1, 4)
% plot(time, y, "Color", "m")
% legend('cart pos')
% ylabel("x [m]")
% xlabel("time [s]")
% subplot(5, 1, 5)
% plot(time, y_prim, "Color", "m")
% legend('cart vel')
% ylabel("V [m/s]")
% xlabel("time [s]")
