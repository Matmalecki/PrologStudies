
% drzewo(1, drzewo(2,nil,nil), drzewo(3,nil,drzewo(6,nil,nil)))

size(nil,0).
size(drzewo(X,L,R),N) :- size(L,N1), size(R,N2), N is 1 + N1 + N2.

search(drzewo(X,_,_), X).
search(drzewo(X,L,P), N) :- search(L,N); search(P,N).

max(drzewo(X,nil,nil),X).
% ???

times(N,nil,nil).
times(N,drzewo(X1,L1,R1),drzewo(X2,L2,R2)) :- X2 is N * X1, times(N,L1,L2), times(N,R1,R2).


preorder(nil,[]).
preorer(drzewo(X,L,R),P) :- preorder(L,P1), preorder(R,P2),
                               append([X|P1],P2,P).

subtree(nil,D).
subtree(drzewo(X,L1,R1),drzewo(X,L2,R2)) :- subtree(L1,R1), subtree(L2,R2).
subtree(drzewo(X,L1,R1),drzewo(Y,L2,R2)) :- subtree(drzewo(X,L1,R1),L2) ; subtree(drzewo(X,L1,R1),R2).

