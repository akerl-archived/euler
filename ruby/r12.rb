require 'prime'
puts (3...Float::INFINITY).reduce(3) { |t, i|
    break t if t.prime_division.transpose[1].reduce(1) {|d, x| d*(x+1)} > 500
    t + i
}

