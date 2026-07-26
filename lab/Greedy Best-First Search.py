import heapq

g = {'A':['B', 'C'], 'B':['D'], 'C':['D'], 'D':[]}
h = {'A': 3, 'B': 2, 'C': 1, 'D': 0}

pq = [(h['A'], 'A')]
v = set()

print("Greedy BFS:")
while pq:
    cost, n = heapq.heappop(pq)
    if n not in v:
        print(n, end=" ")
        v.add(n)
        if h[n] == 0: break
        
        for neighbor in g[n]:
            if neighbor not in v:
                heapq.heappush(pq, (h[neighbor], neighbor))
print()
