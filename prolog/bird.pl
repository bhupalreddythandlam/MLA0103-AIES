bird(sparrow).
bird(eagle).
bird(parrot).
bird(penguin).
bird(ostrich).

cannot_fly(penguin).
cannot_fly(ostrich).

can_fly(Bird) :-
    bird(Bird),
    \+ cannot_fly(Bird).