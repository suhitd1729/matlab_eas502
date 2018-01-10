% Q19  Backward diff
clc
clear all
a = 1;
v=1;
N = 21; 
umax = 1;
umin =0;
x = 0;
xmax = 0.5;
dx = 0.009;

%discretize the domain
du = (umax-umin)/N;
u = umin - du:du:umax +du;

% initial conditions
t0 = u/a - (1/a^2)*v*exp(u*a/v);
t = t0;
tnp1 = t0;
tnp2 = t0;

%loop
%plot(u,t0,'-s')
hold on
nsteps = xmax/dx;
for n = 1 : nsteps
    
    %calculate boundary conditions
    t(1) = t(3);
    t(N + 3) = t(N +1);
    
    %calculate the FOU scheme
    for i = 2 : N+2
         
         tnp1(i) = t(i) - v*dx/du * (t(i) - t(i-1));
        
    end
    
    %update x and t
    %o =0
    x = x + dx;
    t = tnp1 ;
    %t1 = tnp2;
    
    % plot solution
    
    %hold on
    
    %plot(u,t1)
    plot(u,t0,'-s')
    hold on
    plot(u,t)
    title("Using Backward Difference")
end

%xlim([0 1]);