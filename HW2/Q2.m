
%Question2
clear
%close all
clc

x =[0 1 2 3 4 5 6]
y = [-0.02 1.1 1.98 3.05 3.95 5.1 6.02]


x = x(:) ; y = y(:); 

%PART a
n = length(x);

sumx = sum(x); sumy = sum(y);
sumx2 = sum(x.*x); 
sumxy = sum(x.*y);
a(1) = ((sumx2 * sumy) - (sumxy)*(sumx))/((n*sumx2) - sumx^2); %this is the a0 coefficient
a(2) = ((n*sumxy) - sumx*sumy)/((n*sumx2) - sumx^2); %this is the a1 coefficient 
xp = linspace(min(x),max(x)) ;
yp = a(1) +a(2) * xp ;
%creating plot
plot(x,y,'o',xp,yp)
title("linear fitting")
grid on

%computing the least square error for linear  
ypred = a(1)+a(2) * x
linear_mean_sq_error = mean((ypred-y).^2)
linear_mean_sq_error = vpa(linear_mean_sq_error)




%PART b
%using a quadratic function to fit the data 
% to fit f(x) = b0 + b1 x + b2 x^2
p = polyfit(x,y,2)
p(1) %is the value of b2
p(2) %is the value of b1
p(3) %is the value of b0
xpol = linspace(min(x),max(x)) ;
ypol = polyval(p,xpol);
figure
plot(x,y,'o',xpol,ypol)
title("quadratic fitting")
grid on 

%computing the least square error for quadratic  
qypol = polyval(p,x);
qmean_sq_error = mean((qypol-y).^2)
qmean_sq_error = vpa(qmean_sq_error)


if qmean_sq_error > linear_mean_sq_error
    disp("Quadratic curve fitting error is more than Linear curve fitting error")
elseif qmean_sq_error < linear_mean_sq_error 
    disp("Linear curve fitting error is more than Quadratic curve fitting error")
elseif qmean_sq_error == linear_mean_sq_error
    disp("both errors are equal")
end
        
        