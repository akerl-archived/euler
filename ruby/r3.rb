require 'prime'
require 'complex'
i = 600_851_475_143
puts 1.upto(Math.sqrt(i).round).find_all{ |f| i % f == 0 and Prime.prime? f }.last

