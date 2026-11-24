
% Towers of Hanoi

hanoi(0, _, _, _).

hanoi(N, Source, Auxiliary, Destination) :-
    integer(N),
    N > 0,
    M is N - 1,
    hanoi(M, Source, Destination, Auxiliary),
    format('Move disk ~w from ~w to ~w~n',
           [N, Source, Destination]),
    hanoi(M, Auxiliary, Source, Destination).
