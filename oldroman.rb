# Exercise from Section 9.5 of Chris Pine's "Learn to Program" Ruby book. 
# Convert integers to "old" type Roman numberals (e.g., Roman numerals that didn't 
# use subtraction: 9 is VIIII, not IX).
# Jen Trudell March 21, 2015

number1 = "I"
number5 = "V"
number10 = "X"
number50 = "L"
number100 = "C"


def convert_roman(user_number)
lengthofI = user_number % 5

	if user_number == 100
		puts "C"
#
#doesn't work
#	
	elsif user_number < 100 && user_number > 50
		print "L" 
			if lengthofX > 0
				print "X" * lengthofI
			elsif lengthofI > 0 
				puts ("V" * lengthofI) + ("I" * lengthofI)
			end
#
# works
#	
	elsif user_number == 50
		puts "L"
	
	elsif user_number > 10 && user_number < 50
		puts "X" * lengthofI + "I" * lengthofI
#
#doesn't work
#	

	elsif user_number == 10
		puts "X"
	elsif user_number > 5 && user_number < 10
		puts "V" + "I" * lengthofI
	elsif user_number == 5
		puts "V"
	else 
		puts "I" * lengthofI
	end
end


puts "Enter a number between 1 and 100."
user_number = gets.chomp.to_i
if user_number < 0 || user_number > 100
	puts "Try again."
else 
	puts "This program will convert " + user_number.to_s + " to an old school Roman numeral."
	convert_roman(user_number)
end
