function [fitresult, gof] = createFit(Distance_m, Inductive_resistance_mH)
%CREATEFIT(DISTANCE_M,INDUCTIVE_RESISTANCE_MH)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input: Distance_m
%      Y Output: Inductive_resistance_mH
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 20-Mar-2024 19:57:10


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( Distance_m, Inductive_resistance_mH );

% Set up fittype and options.
ft = fittype( 'exp2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [28.8732263995424 -235.290348532882 110.053305882782 -1.63561017019505];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Fitting an exponential funciton to the inductive resistance' );
h = plot( fitresult, xData, yData );
legend( h, 'Inductive resistance [mH] vs. Distance [m]', 'Fitted exponential function', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Distance [m]', 'Interpreter', 'none' );
ylabel( 'Inductive resistance [mH]', 'Interpreter', 'none' );
grid on


