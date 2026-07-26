import heapq

g = {'A':[('B', 2), ('C', 5)], 'B':[('D', 1)], 'C':[('E', 2)], 'D':[], 'E':[]}

pq = [(0, 'A')]
v = set()

print("UCS:")
while pq:
    cost, n = heapq.heappop(pq)
    if n not in v:
        print(f"{n}({cost})", end=" ")
        v.add(n)
        for neighbor, edge_cost in g[n]:
            if neighbor not in v:
                heapq.heappush(pq, (cost + edge_cost, neighbor))
print()
