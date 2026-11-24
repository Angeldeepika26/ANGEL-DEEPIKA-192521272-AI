
% Bird Flight Classification

bird(sparrow).
bird(parrot).
bird(eagle).
bird(penguin).
bird(ostrich).

flightless(penguin).
flightless(ostrich).

can_fly(Bird) :-
    bird(Bird),
    \+ flightless(Bird).

check_flight(Bird) :-
    (   bird(Bird)
    -> (   flightless(Bird)
        -> format('~w cannot fly.~n', [Bird])
        ;   format('~w can fly.~n', [Bird])
        )
    ;   format('No information about ~w.~n', [Bird])
    ).

