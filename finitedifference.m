function[fd,bd,cd,tfd,tbd]=finitedifference(x,f)
    h=x(2)-x(1);
    %forward difference formula
    fd=f;
    fd(1:end-1)=(f(2:end)-f(1:end-1))/h;
    fd(end)=NaN;
    
    %backward difference formula
    bd=f;
    bd(2:end)=(f(2:end)-f(1:end-1))/h;
    bd(1)=NaN;
    
    %central difference formula
    cd=f;
    cd(2:end-1)=(f(3:end)-f(1:end-2))/(2*h);
    cd(1)=NaN;
    cd(end)=NaN;
    
    %two-point forward
    tfd=f;
    tfd(1:end-2)=(4*f(2:end-1)-f(3:end)-3*f(1:end-2))/(2*h);
    tfd(end)=NaN;
    tfd(end-1)=NaN;
    
    %two-point backward
    tbd=f;
    tbd(3:end)=(-4*f(2:end-1)+f(1:end-2)+3*f(3:end))/(2*h);
    tbd(1)=NaN;
    tbd(2)=NaN;
    
%Name: Nhan Vo
%Student ID:017771388
%Quick Summary

%Problem 1

% 1 d) for n1= 101, n2= 201, order of accuracy is 1st order
%      for n1= 201, n2= 401, order of accuracy is 1st order

% 1 e) for n1= 101, n2= 201, order of accuracy is 2nd order
%      for n1= 201, n2= 401, order of accuracy is 2nd order
%  The order of accuracy is greater than part d. I guess because we are
%  finding the average of inputs so it give us a more accurate result.

    
    