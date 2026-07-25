has_hair(fido).
eats_meat(fido).
barks(fido).

gives_milk(bessie).
chews_cud(bessie).

mammal(X) :- has_hair(X).
mammal(X) :- gives_milk(X).

carnivore(X) :- eats_meat(X).

herbivore(X) :- chews_cud(X).

dog(X) :- mammal(X), carnivore(X), barks(X).
cow(X) :- mammal(X), herbivore(X).