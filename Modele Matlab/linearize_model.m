%% Exact linearization of the Simulink model plant_model_for_linearization
%
% This MATLAB script is the command line equivalent of the exact
% linearization tab in linear analysis tool with current settings.
% It produces the exact same linearization results as hitting the Linearize button.

% MATLAB(R) file generated by MATLAB(R) 8.5.1 and Simulink Control Design (TM) 4.2.
%
% Generated on: 11-Apr-2024 13:24:15

%% Specify the model name
model = 'plant_model_for_linearization';

%% Specify the analysis I/Os
% Use root level inports and outports in plant_model_for_linearization
% by passing no input argument to the linearize command for analysis I/Os

%% Specify the operating point
% Create the operating point variable op_trim3 using model initial condition as a starting point
op = operpoint('plant_model_for_linearization');
% Set the states in the model with different values than model initial condition
% State (3) - plant_model_for_linearization/Cintegrator
op.States(3).x = 1.275039359089427;
% Set the inputs in the model with different values than model initial condition
% Input (1) - plant_model_for_linearization/u
op.Inputs(1).u = 0.4547778821501982;


%% Linearize the model
sys = linearize(model,op);
A = sys.a;
A(4,1) = 1;
A = [A, zeros(4,1)];
B = sys.b;
B(4,1) = 0; 

%% Plot the resulting linearization
step(sys)

%%
Q = diag([1000,100,10,1000]);
R = 10;

Ts = 0.001;
Kd = lqrd(A,B,Q,R,Ts)
Kc = lqr(A,B,Q,R)

z_ep = 0.01;
i_ep = op.States(3).x;
u_ep = op.Inputs(1).u;
