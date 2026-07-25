:- dynamic known/1.

rule(c, [a, b]).
rule(d, [c]).
rule(e, [d, f]).
rule(z, [a, y]).

known(a).
known(b).

forward :-
    rule(Conclusion, Premises),
    \+ known(Conclusion),
    all_known(Premises),
    assert(known(Conclusion)),
    format('Derived new fact: ~w~n', [Conclusion]),
    forward.
forward :-
    write('Forward chaining complete. No more facts can be derived.'), nl.

all_known([]).
all_known([Head|Tail]) :-
    known(Head),
    all_known(Tail).