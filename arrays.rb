# practice arrays from ch. 8 of Chris Pine's "Learn to Program"
# March 18, 2015

foods = ['artichoke', 'brioche', 'caramel']

puts foods
puts
puts foods.to_s
puts
puts foods.join(", ")
puts 
puts foods.join(' :) ') + ' 8)'

foods.push 'whiskey'
foods.push 'grass'

foods.each do |x|
	puts x + " is the best food!"
end

puts foods.last
puts foods.pop
puts foods