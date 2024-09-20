def print_sum(n):
    print(n)
    def next_sum(k):
        return print_sum(n+k)
    return next_sum