# Exercise from Section 9.5 of Chris Pine's "Learn to Program" Ruby book. 
# Convert integers to "old" type Roman numerals (e.g., Roman numerals that didn't 
# use subtraction: 9 is VIIII, not IX).
# Jen Trudell April 21, 2015


def convert_roman(number)

roman_1 = "I"
roman_5 = "V"
roman_10 = "X"
roman_50 = "L"
roman_100 = "C"

print "#{number} converted into an old school Roman numeral is: "

	if number < 5
		number.times do 
			print roman_1
		end
		puts
	elsif number >= 5 && number < 10
		print roman_5
		remainder = number % 5
		remainder.times do
			print roman_1
		end
		puts
	elsif number >=10 && number < 50
		divide_10 = number / 10
		divide_10.times do 
			print roman_10
		end
		remainder_10 = number % 10
		include_v(remainder_10)
		puts
	elsif number >=50 && number < 100
		print roman_50
		divide_10 = (number - 50) / 10
		divide_10.times do 
			print roman_10
		end
		remainder_10 = number % 10
		include_v(remainder_10)
		puts
	elsif number == 100
		puts roman_100
	else
	puts "Does not compute!"
	end
end

def include_v(remainder_10)
	if remainder_10 >= 5
		print "V"
		remainder_10 -= 5
		remainder_10.times do
			print "I"
		end
	else	
		remainder_10.times do
			print "I"
		end
	end
end

def prompt
	print ">> "
end

def input_number
	puts "Enter a number between 1 and 100."
	prompt
	user_number = gets.chomp
	number = user_number.to_i
	if number <= 0 || number > 100
		puts "Try again. Type 'quit' to quit the program or hit enter to enter a number to convert."
		prompt
		answer=gets.chomp.downcase
		if answer == "quit"
			exit
		else
			input_number
		end
	else 
		convert_roman(number)
	end
end
puts
puts "This program will convert a number you enter into an old school Roman numeral."
puts "An 'old school' Roman numeral does not use subtraction (i.e., 9 is VIIII and not IX)."
input_number

