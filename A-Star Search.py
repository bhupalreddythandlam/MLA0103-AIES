import heapq

g = {'A':[('B', 1), ('C', 4)], 'B':[('D', 2)], 'C':[('D', 1)], 'D':[]}
h = {'A': 3, 'B': 2, 'C': 1, 'D': 0}

pq = [(h['A'], 0, 'A')]
v = set()

print("A* Search:")
while pq:
    f, cost, n = heapq.heappop(pq)
    if n not in v:
        print(n, end=" ")
        v.add(n)
        if h[n] == 0: break
        
        for neighbor, edge_cost in g[n]:
            if neighbor not in v:
                g_cost = cost + edge_cost
                f_cost = g_cost + h[neighbor]
                heapq.heappush(pq, (f_cost, g_cost, neighbor))
print()
