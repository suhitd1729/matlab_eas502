%Q19 Central Diff 
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

tnp2 = t0;

%loop
%plot(u,t0,'-s')
hold on
nsteps = xmax/dx;
for n = 1 : nsteps
    
    %calculate boundary conditions
    t(1) = t(3);
    t(N + 3) = t(N +1);
    
    %calculate the SOU scheme
    for i=21:1:N-1 
         tnp2(i) = -t(i+2) + 16*t(i+1) -30*t(i+1) + 16*t(i-1) - t(i-2)/12*(N+1)^2
    end
    
    %update x and t
    %o =0
    x = x + dx;
    t = tnp2 ;
    
   plot(u,t0,'-s')
   hold on
   plot(u,t)
   title("Using Central Difference")
end