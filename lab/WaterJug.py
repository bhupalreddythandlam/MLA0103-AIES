from collections import deque

j1 = int(input("Enter Jug 1 capacity: "))
j2 = int(input("Enter Jug 2 capacity: "))
t = int(input("Enter target amount: "))

q = deque([(0, 0)])
v = set()

print("Water Jug Search Path:")
while q:
    a, b = q.popleft()
    if (a, b) in v: continue
    
    print((a, b), end=" ")
    v.add((a, b))
    
    if a == t or b == t:
        print("\nTarget reached!")
        break
    
    states = [
        (j1, b), (a, j2),
        (0, b), (a, 0),
        (a - min(a, j2 - b), b + min(a, j2 - b)),
        (a + min(b, j1 - a), b - min(b, j1 - a))
    ]
    
    for state in states:
        if state not in v:
            q.append(state)
