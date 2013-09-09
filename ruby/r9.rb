catch (:done) { (2..500).each { |a| (2..500).each { |b| next if a**2 + b**2 != (1000-a-b)**2 ; puts a*b*(1000-a-b) ; throw :done } } }

