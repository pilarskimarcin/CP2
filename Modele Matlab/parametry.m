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
z_min = 0;
z_max = 0.025; % [m]
i_min = 0;
v0 = 0.0; % [m/s]

sim_time = 1.5; % [s]