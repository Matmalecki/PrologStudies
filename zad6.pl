%a last(X,L), który jest spełniony, jeżeli X jest ostatnim elementem listy L. 
last(X,[X]).
last(X,[_|L]) :- last(X,L). 

%b delete(X,L1,L2), który jest spełniony, jeżeli L2 równa się L1 bez elementu X. 
delete(X,[X],[]).
delete(X,[X|T],[_|L]) :- delete(_,T,L).
delete(X,[_,T],[_|L]) :- delete(X,T,L).

%c delete(L1,L2), który jest spełniony, jeżeli L2 równa się L1 bez ostatnich trzech elementów. 
delete([],[_,_,_]).
delete([X|L],[X|T]) :- delete(L,T).

%d reverse(L1,L2), który jest spełniony, jeżeli L2 jest listą L1 w odwrotnej kolejności. 
reverse([],[]).
reverse([X|L1], L2) :- reverse(L1,L3), append(L3,[X],L2).

%e evenlength(L) oraz oddlength(L), które są spełnione, jeżeli długość listy L jest parzysta oraz nieparzysta. 

evenlength([]).
evenlength([X,Y|L]) :- evenlength(L).

oddlength(L) :- length(L,N), 1 is N mod 2.

%f shift(L1,L2), który jest spełniony, jeżeli L2 równa się L1 po jednej rotacji do lewej. 

shift([],[]).
shift([X|L1],L2) :- append(L1,[X],L2).

%g quadrat(L1,L2), który jest spełniony, jeżeli L2 zawiera quadraty elementów listy L1. 

quadrat([],[]).
quadrat([X|L1],[Y|L2]) :- Y is X * X, quadrat(L1,L2).

%h combine(L1,L2,L3), który jest spełniony, jeżeli L3 zawiera pary elementów z list L1 i L2. 

combine([],[],[]).
combine([],L,[]).
combine(L,[],[]).
combine([X|L1],[Y|L2],[[X,Y]|L3]) :- combine(L1,L2,L3).

%i palindrom(L), który jest spełniony, jeżeli lista L zawiera palindrom. 

palindrom([]).
palindrom([X]).
palindrom(L) :- reverse(L,L).
/**
without_last([],[]).
without_last([X],[]).
without_last([X|L1],[X|L2]) :- without_last(L1,L2).

palindrom([]).
palindrom([X]).
palindrom([X,Y|L]) :- without_last([Y|L],L1), palindrom(L1).
*/

%j p(X,L,Y,Z), który jest spełniony, jeżeli Y jest poprzednikiem elementu X w liście L a Z następcą elementu X w liście L.
p(X,L,Y,Z) :- append(L1, [Y,X,Z|L2],L).

%k q(X,L1,L2), który jest spełniony, jeżeli L2 równa się początku listy L1 do podwójnego wystąpienia elementu X. 

q(X,L1,L2) :- append(L3,[X,X|L4], L1), append(L3,[X,X],L2).

/**
append explanation 

?- append([a,b], [c], X).
X = [a,b,c].

?- append(X, [Last], [a,b,c]).
X = [a,b],
Last = c.

?- append([a,b], More, List).
List = [a,b|More].

*/