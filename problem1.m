% V a = f
% V x^(j-10_{i-1}
n=100; 
x=linspace(0,pi,n+1); % interpolation points
V=vandermonde(x); % Vandermonde matrix
f=sin(17*x); % 1 X (n+1) row vector of function values
f=f'; % take transpose, convert to column vector


a=V\f; % solve linear system Va=f for a

err = max(abs(V*a-f));

plot(x,f'); hold on;
plot(x,V*a,'ro'); hold off;

function V=vandermonde(x)
    % x is a 1 x (n+1) row vector
    n = size(x,2)-1;
    V= zeros(n+1,n+1);
    for i=1:n+1
        for j=1:n+1
            V(i,j)=(x(i)^(j-1));
        end
    end
end

%Name: Nhan Vo
%Student ID:017771388
%Quick Summary

%Problem 1 part d
% The error(s) are:
% 9.5614 if n=199
% 9.1619 if n=200
% 3.7867 if n=500
% 1.3878 if n=501
