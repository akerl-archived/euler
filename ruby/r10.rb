require 'prime'
puts Prime.take_while{|i| i < 2_000_000}.inject(:+)

