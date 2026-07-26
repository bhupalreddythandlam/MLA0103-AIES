g = {'A':['B','C'], 'B':['D'], 'C':['E'], 'D':[], 'E':[]}

s = ['A']
v = set()

print("DFS:")
while s:
    n = s.pop()
    if n not in v:
        print(n, end=" ")
        v.add(n)
        s.extend(g[n])
print()