def solve_cryptarithmetic(words, result):
    unique_chars = set(''.join(words) + result)
    if len(unique_chars) > 10:
        return []

    letters = list(unique_chars)
    first_letters = {word[0] for word in words + [result]}
    solutions = []

    def to_number(word, mapping):
        return int(''.join(str(mapping[ch]) for ch in word))

    def backtrack(index, mapping, used):
        if index == len(letters):
            values = [to_number(word, mapping) for word in words]
            total = sum(values)
            if total == to_number(result, mapping):
                solutions.append(mapping.copy())
            return

        letter = letters[index]
        for digit in range(10):
            if digit in used:
                continue
            if digit == 0 and letter in first_letters:
                continue
            mapping[letter] = digit
            used.add(digit)
            backtrack(index + 1, mapping, used)
            used.remove(digit)
            del mapping[letter]

    backtrack(0, {}, set())
    return solutions


words = ["SEND", "MORE"]
result = "MONEY"
solutions = solve_cryptarithmetic(words, result)
print(f"Cryptarithmetic: {' + '.join(words)} = {result}")
print(f"Solutions found: {len(solutions)}")
for solution in solutions[:3]:
    print(solution)
