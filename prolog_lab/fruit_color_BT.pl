fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, green).
fruit_color(grape, purple).
fruit_color(cherry, red).
fruit_color(lemon, yellow).

find_fruit(Color, Fruit) :-
    fruit_color(Fruit, Color).