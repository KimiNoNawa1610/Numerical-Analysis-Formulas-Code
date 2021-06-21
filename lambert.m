function [x,W,iterations] = lambert

    x = linspace(1,2,101); % A 1 by 101 vector storing the x values 1,1.01,...1.99,2
    W = zeros(1,101);      % A 1 by 101 vector for storing the values of W(x)
    iterations = 0;        % The total number of iterations required
    
    % bisection method to compute W(1) with [0,2] as starting interval
    f = @(y) y*exp(y) - x(1);    % x(1) gives the first entry of x
    [p,n] = bisection(f,0,2);    % run the bisection method
    W(1) = p;                    % store the result in the first entry of W
    iterations = iterations + n; % update total iterations performed
    
    % use the bisection method to compute remaining values of W(x) for
    % x = 1.01 , 1.02 , 1.03 ... , 1.98 , 1.99 , 2.00
    %do i=2 separately
    f  = @(y) y*exp(y) - x(2); 
    [p,n]=secant(f,0,W(1));
    W(2)=p;
    iterations = iterations + n;
    
    for i=3:101
        f  = @(y) y*exp(y) - x(i);      % x(i) gives the i^th entry of x
        %fp = @(y) exp(y)+y*exp(y);
        %[p,n] = bisection(f,W(i-1),2); % use [W(i-1),2] as starting interval
        %[p,n]=newton(f,fp,W(i-1));
        [p,n]=secant(f,W(i-2),W(i-1));
        W(i) = p;                       % store the result in the i^th entry of W
        iterations = iterations + n;    % update total iterations performed
    end
%Name: Nhan Vo
%Student ID:017771388
%Quick Summary

%problem I
%1b) It took 5034 iterations to complete.
%1c) It took 450 iterations to complete.

%problem II
%2c) It took 652 iteartions to complete.