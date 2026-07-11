# MLA0107-AIES

This repository contains lab experiments and implementations for the AIES (Artificial Intelligence and Expert Systems) course.

## Lab Experiments

#### BFS (Breadth-First Search)

```
CREATE empty queue Q
CREATE empty set Visited

ADD StartNode to Visited
ENQUEUE StartNode into Q

WHILE Q is not empty DO
    CurrentNode ← DEQUEUE Q
    VISIT CurrentNode

    FOR each Neighbor of CurrentNode in Graph DO
        IF Neighbor not in Visited THEN
            ADD Neighbor to Visited
            ENQUEUE Neighbor into Q
        END IF
    END FOR
END WHILE
END BFS
```

#### DFS (Depth-First Search)

```
CREATE empty stack S
CREATE empty set Visited

PUSH StartNode into S

WHILE S is not empty DO
    CurrentNode ← POP S
    
    IF CurrentNode not in Visited THEN
        VISIT CurrentNode
        ADD CurrentNode to Visited

        FOR each Neighbor of CurrentNode in Graph DO
            PUSH Neighbor into S
        END FOR
    END IF
END WHILE
END DFS
```

## Files

- `BFS.py` - Python implementation of Breadth-First Search
- `BFS.txt` - BFS algorithm pseudocode
- `DFS.py` - Python implementation of Depth-First Search
- `DFS.txt` - DFS algorithm pseudocode
