def chain(l, n)
    return n == 1 ? l+1 : ( n.even? ? chain(l+1, n/2) : chain(l+1, 3*n+1) )
end
puts (2..1_000_000).inject([0, 0]) { |winner, start|
    count = chain(0, start)
    count > winner[1] ? [start, count] : winner
}[0]

