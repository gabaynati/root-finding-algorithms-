function [x,n,p] = nif( f,a,N,tol )
%Netanel Gabay
%303095528
%this method calculates the root of a function.
%it does so by choosing a point x0 near the root of f
%and calculates the intersectaing point k of the tangent from f(x0)
%the next iteration if setting x0 to k and calculaing again the
%intersecting point . the base case of the function is when f(x0) close
%to 0(therefore it is the root of f).due to the deviances we choose
%a max deviance 'tol' ,thus the base case if |f(x0)|<tol.
%function to test with:
%f=x^2-4,r=2,nif(f,10,4,0.02)
%calculating the derivative.
syms X;
x0 = a;
df = diff(f);
for k=1:1:N
    %calculating the tangent line equation
    m = subs(df,x0);
    y1 = subs(f,x0);
    tangent  = m*(X - x0)+y1;
    %calculating the intersecting point of the tangent line with
    %x axis.
    x0 = solve(tangent,X);
    x(k) = x0;
    
    %checking if the above point if the root of f with max deviance
    %of tol.
    if abs(subs(f,x0))<tol
        return;
    end
    n=k;
end
p=2;
end

