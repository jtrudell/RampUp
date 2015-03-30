def your_name_age(name, age)
	puts "Your name is #{name} and you are #{age}. That's a good age to be."
end

puts "What is your name?"
your_name = gets.chomp.capitalize

puts "What is your age?"
your_age = gets.chomp
your_name_age(your_name, your_age)





