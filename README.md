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

#### N-Queens Problem

```
DEFINE function IsSafe(board, row, col)
    FOR each previousRow FROM 0 TO row - 1 DO
        IF board[previousRow] == col OR ABS(board[previousRow] - col) == ABS(previousRow - row) THEN
            RETURN false
        END IF
    END FOR
    RETURN true
END FUNCTION

DEFINE function SolveNQueens(n)
    INITIALIZE board as array of size n with -1
    INITIALIZE solutions as empty list

    DEFINE function PlaceQueen(row)
        IF row == n THEN
            ADD copy of board to solutions
            RETURN
        END IF

        FOR col FROM 0 TO n - 1 DO
            IF IsSafe(board, row, col) THEN
                board[row] = col
                PlaceQueen(row + 1)
                board[row] = -1
            END IF
        END FOR
    END FUNCTION

    PlaceQueen(0)
    RETURN solutions
END FUNCTION
```

#### Cryptarithmetic Problem

```
DEFINE function ToNumber(word, mapping)
    SET numberString = EMPTY STRING
    FOR each letter in word DO
        APPEND mapping[letter] to numberString
    END FOR
    RETURN integer value of numberString
END FUNCTION

DEFINE function SolveCryptarithmetic(words, result)
    SET uniqueLetters = set of all letters in words and result
    IF size of uniqueLetters > 10 THEN
        RETURN empty list
    END IF

    SET letters = list of uniqueLetters
    SET firstLetters = set of first letters of each word and result
    SET solutions = empty list

    DEFINE function Backtrack(index, mapping, usedDigits)
        IF index == size of letters THEN
            SET values = map each word through ToNumber(word, mapping)
            IF sum(values) == ToNumber(result, mapping) THEN
                ADD copy of mapping to solutions
            END IF
            RETURN
        END IF

        SET letter = letters[index]
        FOR digit FROM 0 TO 9 DO
            IF digit in usedDigits THEN
                CONTINUE
            END IF
            IF digit == 0 AND letter in firstLetters THEN
                CONTINUE
            END IF
            SET mapping[letter] = digit
            ADD digit to usedDigits
            Backtrack(index + 1, mapping, usedDigits)
            REMOVE digit from usedDigits
            REMOVE letter from mapping
        END FOR
    END FUNCTION

    Backtrack(0, empty mapping, empty set)
    RETURN solutions
END FUNCTION
```

#### Map Coloring Problem

```
DEFINE function IsValid(coloring, node, color, graph)
    FOR each neighbor in graph[node] DO
        IF neighbor in coloring AND coloring[neighbor] == color THEN
            RETURN false
        END IF
    END FOR
    RETURN true
END FUNCTION

DEFINE function SolveMapColoring(graph, colors)
    SET nodes = list of graph keys
    SET coloring = empty mapping
    SET solutions = empty list

    DEFINE function Assign(index)
        IF index == size of nodes THEN
            ADD copy of coloring to solutions
            RETURN
        END IF

        SET node = nodes[index]
        FOR each color in colors DO
            IF IsValid(coloring, node, color, graph) THEN
                SET coloring[node] = color
                Assign(index + 1)
                REMOVE node from coloring
            END IF
        END FOR
    END FUNCTION

    Assign(0)
    RETURN solutions
END FUNCTION
```

#### Decision Tree - Problem 1

```
IMPORT pandas
IMPORT DecisionTreeClassifier and plot_tree from sklearn.tree
IMPORT matplotlib.pyplot

CREATE dataset containing Outlook, Temp, Humidity, Wind, and Play columns
CONVERT dataset into a pandas DataFrame

SELECT Outlook, Temp, Humidity, and Wind as input features X
SELECT Play as target y
CONVERT categorical input features into one-hot encoded columns

CREATE DecisionTreeClassifier using entropy as the splitting criterion
TRAIN the model using X and y
CALCULATE and DISPLAY training accuracy
PLOT the trained decision tree with feature names and class names
DISPLAY the tree visualization
```

#### Decision Tree - Problem 2

```
IMPORT math
CREATE dataset with record number, A1, A2, A3, and class label

FUNCTION Entropy(dataset)
    COUNT the occurrences of each class label
    CALCULATE each class probability
    RETURN the sum of -probability * log2(probability)
END FUNCTION

FUNCTION InformationGain(dataset, feature)
    CALCULATE entropy of the complete dataset
    FOR each unique feature value DO
        CREATE the matching subset
        ADD subset proportion * Entropy(subset) to weighted entropy
    END FOR
    RETURN complete entropy - weighted entropy
END FUNCTION

FUNCTION BuildTree(dataset, available features)
    IF all class labels are equal THEN
        RETURN that class label
    END IF
    IF no features remain THEN
        RETURN the most common class label
    END IF
    SELECT the feature with maximum InformationGain
    FOR each value of the selected feature DO
        RECURSIVELY build a subtree using the matching subset
    END FOR
    RETURN the decision tree
END FUNCTION

SET features to A1, A2, and A3
BUILD and DISPLAY the decision tree
```

#### Decision Tree - Problem 3

```
IMPORT math
CREATE dataset with record number, A1, A2, and class label

FUNCTION Entropy(dataset)
    COUNT the occurrences of each class label
    CALCULATE each class probability
    RETURN the sum of -probability * log2(probability)
END FUNCTION

FUNCTION InformationGain(dataset, feature)
    CALCULATE entropy of the complete dataset
    FOR each unique feature value DO
        CREATE the matching subset
        ADD subset proportion * Entropy(subset) to weighted entropy
    END FOR
    RETURN complete entropy - weighted entropy
END FUNCTION

FUNCTION BuildTree(dataset, available features)
    IF all class labels are equal THEN
        RETURN that class label
    END IF
    IF no features remain THEN
        RETURN the most common class label
    END IF
    SELECT the feature with maximum InformationGain
    FOR each value of the selected feature DO
        RECURSIVELY build a subtree using the matching subset
    END FOR
    RETURN the decision tree
END FUNCTION

SET features to A1 and A2
CALCULATE and DISPLAY information gain for each feature
BUILD and DISPLAY the decision tree
```
