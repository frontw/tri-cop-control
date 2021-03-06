function [fitresult, gof] = TTO_data_fitV2(throtle, Mom, Omega)
%CREATEFIT(THROTLE,MOM,OMEGA)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : throtle
%      Y Input : Mom
%      Z Output: Omega
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 02-Dec-2014 14:05:47


%% Fit: 'untitled fit 1'.
[xData, yData, zData] = prepareSurfaceData( throtle, Mom, Omega );

% Set up fittype and options.
ft = fittype( '(a*log((x)*atan2(x,y))+b)*(-y^2+c)', 'independent', {'x', 'y'}, 'dependent', 'z' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf -Inf];
opts.StartPoint = [0.960184316710677 0.224512464774936 0.00927279859018504];
opts.Upper = [Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, [xData, yData], zData );
legend( h, 'untitled fit 1', 'Omega vs. throtle, Mom', 'Location', 'NorthEast' );
% Label axes
xlabel( 'throtle' );
ylabel( 'Mom' );
zlabel( 'Omega' );
grid on
view( -73.5, 16 );


