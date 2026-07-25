% planet(Name, Type, NumberOfMoons).

planet(mercury, terrestrial, 0).
planet(venus, terrestrial, 0).
planet(earth, terrestrial, 1).
planet(mars, terrestrial, 2).
planet(jupiter, gas_giant, 95).
planet(saturn, gas_giant, 146).
planet(uranus, ice_giant, 28).
planet(neptune, ice_giant, 16).

% Rule to find planets that have moons
has_moons(Planet) :-
    planet(Planet, _, Moons),
    Moons > 0.