def fib_wrap(a, b, max, sum)
    return sum if b > max
    sum += b if b.even?
    fib_wrap(b, b+a, max, sum)
end

puts fib_wrap(1, 2, 4_000_000, 0)

