
% Greedy Best-First Search

edge(s, a).
edge(s, b).
edge(a, c).
edge(b, d).
edge(c, g).
edge(d, g).

h(s, 7).
h(a, 4).
h(b, 2).
h(c, 1).
h(d, 1).
h(g, 0).

best_first(Start, Goal, Path) :-
    h(Start, H),
    search([H-[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

search([_-[Goal|Rest]|_], Goal, [Goal|Rest]).

search([_-[Node|Rest]|Open], Goal, Path) :-
    Node \= Goal,
    findall(H-[Next,Node|Rest],
            (edge(Node, Next),
             \+ member(Next, [Node|Rest]),
             h(Next, H)), Children),
    append(Open, Children, Candidates),
    keysort(Candidates, Sorted),
    search(Sorted, Goal, Path).

