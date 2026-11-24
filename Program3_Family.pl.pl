
% Family Tree

male(ravi).
male(arun).
male(karan).

female(meena).
female(anu).
female(priya).

parent(ravi, arun).
parent(meena, arun).
parent(ravi, anu).
parent(meena, anu).
parent(arun, priya).
parent(anu, karan).

father(X, Y) :-
    male(X),
    parent(X, Y).

mother(X, Y) :-
    female(X),
    parent(X, Y).

grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    dif(X, Y).

ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

