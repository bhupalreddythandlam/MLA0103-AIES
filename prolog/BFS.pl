edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).

heuristic(a, 10).
heuristic(b, 8).
heuristic(c, 5).
heuristic(d, 7).
heuristic(e, 3).
heuristic(f, 6).
heuristic(g, 0). 

goal(g).

best_first(Start, Path) :-
    heuristic(Start, H),
    search([H-[Start]], RevPath),
    reverse(RevPath, Path).

search([_-[Node|Path] | _], [Node|Path]) :-
    goal(Node).

search([_-[Node|Path] | Rest], FinalPath) :-
    findall(H-[Next, Node | Path],
            (edge(Node, Next), \+ member(Next, [Node|Path]), heuristic(Next, H)),
            Children),
    append(Rest, Children, NewQueue),
    keysort(NewQueue, SortedQueue),
    search(SortedQueue, FinalPath).