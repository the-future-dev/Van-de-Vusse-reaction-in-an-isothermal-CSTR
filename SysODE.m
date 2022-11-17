% This function defines the system of ordinary differential equations (ODE)
function  dxdt = SysODE(x,u,d,p)

% ==========MODEL PARAMETERS==========================

%states
Ca = x(1)
Cb = x(2)

%input
q = u(1);

%disturbances
Caf = d(1);
k1  = d(2);
k2  = d(3);

%parameters
V = p(1);
k3 = p(2);

%Differential equations
dxdt(1)=(Caf*q)/V-(Ca*q)/V-Ca*(k1+Ca*k3);   
dxdt(2)=-Cb*q/V+k1*Ca-k2*Cb;

dxdt = dxdt(:); % system of differential equations as vertical vector


