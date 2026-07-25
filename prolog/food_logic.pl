food(apple).
food(vegetables).
food(X) :- eats(Person, X), alive(Person).

eats(anil, peanuts).
eats(harry, X) :- eats(anil, X).

alive(anil).
likes(john, X) :- food(X).