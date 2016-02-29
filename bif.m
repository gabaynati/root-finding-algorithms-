function [ x,n,p ] = bif( f,a,b,N,tol  )
%Netanel Gabay
%303095528
%this method finds the root of function f up to the max deviance tol.
%this method requers that f will be continous in [a,b] and f(a) and f(b)
%will have opposite signs.
%if it is so we can use Intermediate value theorem which guarantee that
%f has at least one root in the interval [a,b].
%the method works in this form:
%it takes two points with opposite y signs.
%then it divides the interval into to two intervals by c=(a+b)/2.
%i.e [a,c] and [c,b].
%then it choose the interval which both of it's edges has opposite y signs,
%and forget the other one.
%then it repeats that form N times.
%the base case is when |f(c)|<tol(meaning that c is close to the root
%of f up to the deviance 'tol',
%or when the interval length has been shrink to size smaller than tol, which
%means that c is very close to the root.
%function to run with:
%f=cos(x/2), the root is pei in the interval [0,8].
%bif(f,0,8,6,0.06)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%checking if f(a)and f(b) have opposite signs
%if it does not have we cant use the Intermediate value theorem.
%i.e. there isnt al least one root of f in the interval [a,b].
if subs(f,a)*subs(f,b)>0
end;


for k=1:1:N
    c=(a+b)/2;
    %checking if f(a) and f(c) has opposite signs so we will
    %be able to use the Intermediate value theorem.
    %if it is so we will choose the interval [a,c] and forget [c,b].
    if subs(f,a)*subs(f,c)<0
        b=c;
    end
    %checking if f(b) and f(c) has opposite signs so we will
    %be able to use the Intermediate value theorem.
    %if it is so we will choose the interval [c,b] and forget [a,c].
    if subs(f,b)*subs(f,c)<0
        a=c;
    end
    x(k)=c;
    %checking if f(c) is close to zero up to the max deviance 'tol',
    %or the interval has been shrink to less then the max deviance 'tol'.
    %if it is so the algorithm will exit.
    if abs( subs(f,c) )<tol||(abs( b-a )<tol)
        return;
    end
    n=k;
end
p=1;


end

