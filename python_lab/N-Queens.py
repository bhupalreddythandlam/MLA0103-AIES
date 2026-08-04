def is_safe(board, row, col, n):
    for r in range(row):
        c = board[r]
        if c == col or abs(c - col) == abs(r - row):
            return False
    return True


def solve_n_queens(n):
    board = [-1] * n
    solutions = []

    def place_queen(row):
        if row == n:
            solutions.append(board.copy())
            return
        for col in range(n):
            if is_safe(board, row, col, n):
                board[row] = col
                place_queen(row + 1)
                board[row] = -1

    place_queen(0)
    return solutions


n = 8
solutions = solve_n_queens(n)
print(f"N-Queens ({n}) Solutions: {len(solutions)}")
for index, solution in enumerate(solutions[:3], start=1):
    print(f"Solution {index}: {solution}")

if len(solutions) > 3:
    print("...")
