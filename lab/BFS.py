from collections import deque

g = {'A':['B','C'], 'B':['D'], 'C':['E'], 'D':[], 'E':[]}

q = deque(['A'])
v = set()

print("BFS:")
while q:
    n = q.popleft()
    if n not in v:
        print(n, end=" ")
        v.add(n)
        q.extend(g[n])