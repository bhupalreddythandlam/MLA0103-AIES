import math

def alpha_beta(depth, node_index, is_max, scores, target_depth, alpha, beta):
    if depth == target_depth:
        return scores[node_index]
    
    if is_max:
        best = -math.inf
        for i in range(2):
            val = alpha_beta(depth + 1, node_index * 2 + i, False, scores, target_depth, alpha, beta)
            best = max(best, val)
            alpha = max(alpha, best)
            if beta <= alpha:
                break
        return best
    else:
        best = math.inf
        for i in range(2):
            val = alpha_beta(depth + 1, node_index * 2 + i, True, scores, target_depth, alpha, beta)
            best = min(best, val)
            beta = min(beta, best)
            if beta <= alpha:
                break
        return best

scores = [3, 5, 2, 9, 12, 5, 23, 23]
tree_depth = int(math.log2(len(scores)))
print("Alpha-Beta Optimal Value:", alpha_beta(0, 0, True, scores, tree_depth, -math.inf, math.inf))
