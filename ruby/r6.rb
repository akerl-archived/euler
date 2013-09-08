range = (1..100)
puts range.inject(:+)**2 - range.inject{ |acc, i| acc += i**2 }

