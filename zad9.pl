
% Proszę zdefiniować predykat permutation(L1,L2), który jest spełniony, jeżeli lista L2 jest permutacją listy L1.
% Przy użyciu ";" powiennien być możliwe wyliczać wszystkie permutacje listy L1. 

permutation([],[]).
permutation(L,[X|P]) :- append(U,[X|V],L),
                        append(U,V,W),
                        permutation(W,P).