man(marcus).
pompeian(marcus).
ruler(caesar).
try_to_assassinate(marcus, caesar).

person(X) :- man(X).
roman(X) :- pompeian(X).

loyal_to(X, Y) :-
    person(X),
    ruler(Y),
    \+ try_to_assassinate(X, Y).

hates(X, caesar) :-
    roman(X),
    \+ loyal_to(X, caesar).