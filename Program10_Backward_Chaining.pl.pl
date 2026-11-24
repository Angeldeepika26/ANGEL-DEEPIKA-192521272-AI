
% Backward Chaining

kb_fact(has_feathers(tweety)).
kb_fact(lays_eggs(tweety)).
kb_fact(healthy(tweety)).
kb_fact(has_feathers(polly)).
kb_fact(lays_eggs(polly)).

kb_rule(bird(X),
        [has_feathers(X), lays_eggs(X)]).

kb_rule(can_fly(X), [bird(X), healthy(X)]).

prove(Goal) :-
    kb_fact(Goal).

prove(Goal) :-
    kb_rule(Goal, Premises),
    prove_all(Premises).

prove_all([]).

prove_all([Goal|Rest]) :-
    prove(Goal),
    prove_all(Rest).

check_goal(Goal) :-
    (   prove(Goal)
    -> writeln('Goal proved.')
    ;   writeln('Goal cannot be proved.')
    ).
