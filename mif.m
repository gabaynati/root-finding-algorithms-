function [x,n,p] = mif(f,a,b,N,tol)
%Netanel Gabay
%303095528
%this function calculate the approximate value of the root
%of f with a max deviance of tol.
%the secant method use secant which two of its edges points are of
%function f .
%in the iteration it move the probe point alwayes to the intersecating
%point k with the x axis of the secant line.
%when f(k)=0 we know the the point is the root of f.
%because there is calculation error we allow f(k) to be f(k)<|tol|.
%function to test with:
%f2= ((x-2)/(((x-2)^2+1)^0.5)) ;
%f1=((x-2)/(((x-2)^2+1)^0.5))*(-1);
%mif(f,0,15,2,0.35).
%the root of this two functions is r=2;
syms X;
x1=a;
x0=b;
for i=0:1:N
    %calculating the secant line equation.
    y1=subs(f,x1);
    y0=subs(f,x0);
    m=(y0-y1)/(x0-x1);
    secant_eqution=m*(X-x0)+y0;
    %finding the intersecting point of the secant line with x axis
    x0=solve(secant_eqution,X);
    x(i+1)=x0;
    n=i;
    double(subs(f,x0))
    %checking if the above point is the root of f when allowed
    %max deviance of tol
    if(abs(subs(f,x0))<abs(tol))
        return
    end
    n=i;
end
p=1.618;
end

