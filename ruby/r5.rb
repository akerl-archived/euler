#puts 1.upto(Float::INFINITY).find { |i| (1...20).all? { |t| i % t == 0 } }
puts (1...20).inject(:lcm)

