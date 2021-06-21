function [x,f]= laplace(a,b,n,g)
%a: left endpt
%b: right endpt
%n: n+1 equally space points
%g: function, -f''=

%make grid points
x=linspace(a,b,n+1);
h=x(2)-x(1);

%set up and solve linear system
A= gallery('tridiag',-ones(n,1),2*ones(n+1,1),-ones(n,1));

A(1,1)=1;
A(1,2)=0;
%A(1,3)=-1;
A(end,end)=1;
A(end,end-1)=0;

rhs= h*h*(g(x)');
rhs(1)=-0.2;
rhs(end)=0.1;

f=A\rhs;

%Name: Nhan Vo
%Student ID:017771388
%Quick Summary

%Problem 2

% 2 b) h1=0.0628, h2= 0.0314, p=2.0002
% 2 c) h1=0.0628, h2= 0.0314, p=2.1821




