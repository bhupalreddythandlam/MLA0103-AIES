:- dynamic fact/1.

% Initial facts
fact(fever).
fact(cough).

% Rules
rule(fever, flu).
rule(cough, cold).
rule(flu, medicine).
rule(cold, syrup).

% Forward Chaining
forward_chain :-
    rule(X, Y),
    fact(X),
    \+ fact(Y),
    assertz(fact(Y)),
    write('Derived: '),
    write(Y),
    nl,
    fail.

forward_chain.

% Display all facts
show_facts :-
    write('Final Facts:'), nl,
    fact(X),
    write(X), nl,
    fail.

show_facts.

% Main predicate
start :-
    forward_chain,
    show_facts.