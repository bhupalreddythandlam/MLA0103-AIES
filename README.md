# MLA0103-AIES

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

#### UCS (Uniform Cost Search)

```
CREATE empty priority queue PQ
CREATE empty set Visited

ENQUEUE (0, StartNode) into PQ

WHILE PQ is not empty DO
    Cost, CurrentNode ← DEQUEUE_MIN PQ
    
    IF CurrentNode not in Visited THEN
        VISIT CurrentNode
        ADD CurrentNode to Visited

        FOR each (Neighbor, EdgeCost) of CurrentNode in Graph DO
            IF Neighbor not in Visited THEN
                TotalCost ← Cost + EdgeCost
                ENQUEUE (TotalCost, Neighbor) into PQ
            END IF
        END FOR
    END IF
END WHILE
END UCS
```

#### Water Jug Problem

```
PROMPT User for Jug1_Cap, Jug2_Cap, Target

CREATE empty queue Q
CREATE empty set Visited

ENQUEUE (0, 0) into Q

WHILE Q is not empty DO
    (A, B) ← DEQUEUE Q
    
    IF (A, B) not in Visited THEN
        VISIT (A, B)
        ADD (A, B) to Visited
        
        IF A == Target OR B == Target THEN
            STOP SEARCH
        END IF
        
        CREATE NextStates containing:
            Fill actions: (Jug1_Cap, B), (A, Jug2_Cap)
            Empty actions: (0, B), (A, 0)
            Pour actions: Math for transferring water until full/empty
            
        FOR each State in NextStates DO
            IF State not in Visited THEN
                ENQUEUE State into Q
            END IF
        END FOR
    END IF
END WHILE
END WATER_JUG
```

#### A* Search

```
CREATE empty priority queue PQ
CREATE empty set Visited

Calculate F = G(StartNode) + H(StartNode)
ENQUEUE (F, G, StartNode) into PQ

WHILE PQ is not empty DO
    F, G, CurrentNode ← DEQUEUE_MIN PQ
    
    IF CurrentNode not in Visited THEN
        VISIT CurrentNode
        ADD CurrentNode to Visited
        
        IF CurrentNode is Goal THEN
            STOP SEARCH
        END IF

        FOR each (Neighbor, EdgeCost) of CurrentNode DO
            IF Neighbor not in Visited THEN
                New_G ← G + EdgeCost
                New_F ← New_G + H(Neighbor)
                ENQUEUE (New_F, New_G, Neighbor) into PQ
            END IF
        END FOR
    END IF
END WHILE
END A_STAR
```

#### Greedy Best-First Search

```
CREATE empty priority queue PQ
CREATE empty set Visited

ENQUEUE (H(StartNode), StartNode) into PQ

WHILE PQ is not empty DO
    H_Cost, CurrentNode ← DEQUEUE_MIN PQ
    
    IF CurrentNode not in Visited THEN
        VISIT CurrentNode
        ADD CurrentNode to Visited
        
        IF CurrentNode is Goal THEN
            STOP SEARCH
        END IF

        FOR each Neighbor of CurrentNode DO
            IF Neighbor not in Visited THEN
                ENQUEUE (H(Neighbor), Neighbor) into PQ
            END IF
        END FOR
    END IF
END WHILE
END GREEDY_BFS
```

#### Min-Max Algorithm

```
FUNCTION MinMax(Depth, NodeIndex, IsMax, Scores, TargetDepth)
    IF Depth == TargetDepth THEN
        RETURN Scores[NodeIndex]
    END IF

    IF IsMax is TRUE THEN
        LeftChild ← MinMax(Depth + 1, NodeIndex * 2, FALSE, Scores, TargetDepth)
        RightChild ← MinMax(Depth + 1, NodeIndex * 2 + 1, FALSE, Scores, TargetDepth)
        RETURN MAXIMUM(LeftChild, RightChild)
    ELSE
        LeftChild ← MinMax(Depth + 1, NodeIndex * 2, TRUE, Scores, TargetDepth)
        RightChild ← MinMax(Depth + 1, NodeIndex * 2 + 1, TRUE, Scores, TargetDepth)
        RETURN MINIMUM(LeftChild, RightChild)
    END IF
END FUNCTION
```

#### Alpha-Beta Pruning

```
FUNCTION AlphaBeta(Depth, NodeIndex, IsMax, Scores, TargetDepth, Alpha, Beta)
    IF Depth == TargetDepth THEN
        RETURN Scores[NodeIndex]
    END IF

    IF IsMax is TRUE THEN
        Best ← -INFINITY
        FOR each Child of Node DO
            Val ← AlphaBeta(Depth + 1, ChildIndex, FALSE, Scores, TargetDepth, Alpha, Beta)
            Best ← MAXIMUM(Best, Val)
            Alpha ← MAXIMUM(Alpha, Best)
            IF Beta <= Alpha THEN
                BREAK
            END IF
        END FOR
        RETURN Best
    ELSE
        Best ← +INFINITY
        FOR each Child of Node DO
            Val ← AlphaBeta(Depth + 1, ChildIndex, TRUE, Scores, TargetDepth, Alpha, Beta)
            Best ← MINIMUM(Best, Val)
            Beta ← MINIMUM(Beta, Best)
            IF Beta <= Alpha THEN
                BREAK
            END IF
        END FOR
        RETURN Best
    END IF
END FUNCTION
```

