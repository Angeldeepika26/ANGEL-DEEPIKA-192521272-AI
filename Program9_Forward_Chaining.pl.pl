
% Forward Chaining

initial_facts([has_feathers, lays_eggs, healthy]).

% rule(Conclusion, Premises).
rule(bird, [has_feathers, lays_eggs]).
rule(can_fly, [bird, healthy]).

all_known([], _).

all_known([P|Ps], Facts) :-
    member(P, Facts),
    all_known(Ps, Facts).

forward_chain(Facts, Final) :-
    (   rule(Head, Body),
        all_known(Body, Facts),
        \+ member(Head, Facts)
    ->  append(Facts, [Head], More),
        forward_chain(More, Final)
    ;   Final = Facts
    ).

run_forward(Final) :-
    initial_facts(Start),
    forward_chain(Start, Final).

