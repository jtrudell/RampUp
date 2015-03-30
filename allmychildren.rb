# practicing methods and arrays
# Jen Trudell March 21, 2015


def children_text(num)
	print "You have #{num} "
	if num == 1
		puts " child!"
	else 
		puts " children!"
	end
	puts "If you had twice as many children, you'd have " + (num *2).to_s + " children!"
	half_child = num/2.0
	puts "If you had half as many children, you'd have " + half_child.to_s + " children!"
	if half_child % 1 != 0
		puts "How did you manage to have half a child?"
	end
	puts "What are your children's names? Enter them with commas."
	entered_names = gets.chomp
	childrens_names = entered_names.split(", ")
	childrens_names.push("Not My Kid")
	puts "#{childrens_names.last} is your favorite. Admit it."
	childrens_names.pop
	puts "What is your last name?"
	last_name=gets.chomp
	puts "So their full names are:"
	childrens_names.each do |x| 
		puts "#{x} #{last_name}"
	end
end

puts "Do you have any children?"
children = gets.chomp.downcase
if children == "yes"
	puts "How many?"
	num_children = gets.chomp.to_i
	children_text(num_children)
else 
	puts "Ok, no kids. How many kids would you like?"
	potential_kids = gets.chomp.to_i
	puts "Here is information about the #{potential_kids} kids you don't have!"
	children_text(potential_kids)
	
end