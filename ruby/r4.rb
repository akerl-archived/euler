range = (100...999)
max = 0
range.each { |a| range.each { |b| c = a*b ; max = c if c > max and c.to_s == c.to_s.reverse } }    
puts max

