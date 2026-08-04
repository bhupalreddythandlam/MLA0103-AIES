def is_valid(coloring, node, color, graph):
    for neighbor in graph[node]:
        if neighbor in coloring and coloring[neighbor] == color:
            return False
    return True


def solve_map_coloring(graph, colors):
    nodes = list(graph.keys())
    coloring = {}
    solutions = []

    def assign(index):
        if index == len(nodes):
            solutions.append(coloring.copy())
            return
        node = nodes[index]
        for color in colors:
            if is_valid(coloring, node, color, graph):
                coloring[node] = color
                assign(index + 1)
                del coloring[node]

    assign(0)
    return solutions

graph = {
    'A': ['B', 'D', 'E'],
    'B': ['A', 'C', 'D', 'E', 'F'],
    'C': ['B', 'E', 'F'],
    'D': ['A', 'B', 'E', 'G'],
    'E': ['A', 'B', 'C', 'D', 'F', 'G', 'H', 'I'],
    'F': ['B', 'C', 'E', 'H', 'I'],
    'G': ['D', 'E', 'H', 'J'],
    'H': ['D', 'E', 'F', 'G', 'I', 'J'],
    'I': ['E', 'F', 'H', 'J'],
    'J': ['G', 'H', 'I']
}

# Added 'Yellow' because the graph contains a clique of size 4 (A, B, D, E)
colors = ['Red', 'Green', 'Blue', 'Yellow']
solutions = solve_map_coloring(graph, colors)

print(f"Map Coloring Solutions: {len(solutions)}")
for index, solution in enumerate(solutions[:5], start=1):
    print(f"Solution {index}: {solution}")

if len(solutions) > 5:
    print("...")