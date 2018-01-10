%Q20
clc 
clear
% partA for Lagranges Interpolation
rFunc = @(x) (1 + 25 *(x.^2)).^-1
x_5 = linspace(-1,1,5);
x_11 = linspace(-1,1,11);
x_21 = linspace(-1,1,21);

x = linspace(-1,1,50);
y = rFunc(x)
    
%% for 5 points 
xx = x_5;
yy = lagrange(xx,x,y);
plot(x,y,'-.',xx,yy,'-ok')
title("For 5 points")
legend("Actual Function","Lagranges Poly");

%% for 11 points 
xx = x_11;
yy = lagrange(xx,x,y);
plot(x,y,'-.',xx,yy,'-ok')
title("For 11 points")
legend("Actual Function","Lagranges Poly");

%% for 21 points 
xx = x_21;
yy = lagrange(xx,x,y);
plot(x,y,'-.',xx,yy,'-ok')
title("For 21 points")
legend("Actual Function","Lagranges Poly");

% PartB Using Linear Splines
%% for 5 points
xq = x_5;
vq = interp1(x,y,xq,'linear');
plot(x,y,'-.',xq,vq,'-ok')
title("For 5 points")
legend("Actual Function","Linear Spline");


%% for 11 points
xq = x_11;
vq = interp1(x,y,xq,'linear');
plot(x,y,'-.',xq,vq,'-ok')
title("For 11 points")
legend("Actual Function","Linear Spline");

%% for 21 points
xq = x_21;
vq = interp1(x,y,xq,'linear');
plot(x,y,'-.',xq,vq,'-ok')
title("For 21 points")
legend("Actual Function","Linear Spline");


% part c Using Cubic Splines
%% for 5 points
xq = x_5;
vq = interp1(x,y,xq,'spline');
plot(x,y,'-.',xq,vq,'-ok')
title("For 5 points")
legend("Actual Function","cubic Spline");


%% for 11 points
xq = x_11;
vq = interp1(x,y,xq,'spline');
plot(x,y,'-.',xq,vq,'-ok')
title("For 11 points")
legend("Actual Function","cubic Spline");

%% for 21 points
xq = x_21;
vq = interp1(x,y,xq,'spline');
plot(x,y,'-.',xq,vq,'-ok')
title("For 21 points")
legend("Actual Function","cubic Spline");