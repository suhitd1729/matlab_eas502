function integral = trapezoidal(a,b,n,fun)
% fun = Function 
% a= Initial point of integral 
% b=  Last point of integral
% n= # of sub-intervals ,must be integer
result=0; 
h = (b-a)/n; %Finding space between each subinterval
x = a+h:h:b-h; %Finding midpoints of each subintervals.
for i=1:n-1
    result =result+fun(x(i));
end
result=h*(result+0.5*(fun(a)+fun(b)));
integral=result;
end
