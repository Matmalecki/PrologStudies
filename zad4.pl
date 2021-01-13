parent(laura, lily).
parent(john, jimmy).
parent(john, lily).
parent(eve, rick).
parent(rick, laura).

female(laura).
male(john).

child(X,Y) :- parent(X,Y).

mother(X,Y) :- female(X), parent(X,Y).

sister(X,Y) :- (X \= Y,)
               female(X), parent(Z,X), parent(Z,Y).

has_a_child(X) :- parent(X,Y).

grandparent(X,Y) :- parent(X,Z), parent(Z,Y).

predecessor(X,Y) :- parent(X,Y).
predecessor(X,Y) :- parent(X,Z), predecessor(Z,Y).
