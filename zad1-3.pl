member(X, [X|L]).
member(X,[Y|L]) :- member(X,L).

mylength(0,[]).
mylength(N,[_|L]) :- mylength(M,L), N is M+1.

fib(0,W) :- W is 0.
fib(1,W) :- W is 1.
fib(X,W) :- X1 is X-1, X2 is X-2, fib(X1,W1), fib(X2, W2), W is W1+W2.