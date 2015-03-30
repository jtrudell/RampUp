# Prints out "99 Bottles of Beer on the Wall".
# Jen Trudell March 29, 2015

num_bottles = 99
nextnum_bottles = 98

while num_bottles >= 3

	puts "#{num_bottles} bottles of beer on the wall, #{num_bottles} bottles of beer. Take one down, \npass it arround, #{nextnum_bottles} bottles of beer on the wall."

	puts #blank line

	num_bottles -= 1
	nextnum_bottles -= 1

end

puts "2 bottles of beer on the wall, 2 bottles of beer. Take one down, \npass it arround, 1 bottle of beer on the wall."

puts #blank line

puts "1 bottle of beer on the wall, 1 bottle of beer. Take one down, \npass it arround, no bottles of beer on the wall."

puts #blank line