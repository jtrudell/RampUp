# Exercise from Section 9.5 of Chris Pine's "Learn to Program" Ruby book. 
# Convert integers to "old" type Roman numberals (e.g., Roman numerals that didn't 
# use subtraction: 9 is VIIII, not IX).
# Jen Trudell April 18, 2015


def convert_roman(number)

roman_1 = "I"
roman_5 = "V"
roman_10 = "X"
roman_50 = "L"
roman_100 = "C"

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
		deal_with_v(remainder_10)
		puts
	elsif number >=50 && number < 100
		print roman_50
		divide_10 = (number - 50) / 10
		divide_10.times do 
			print roman_10
		end
		remainder_10 = number % 10
		deal_with_v(remainder_10)
		puts
	elsif number == 100
		puts roman_100
	else
	puts "Does not compute!"
	end
end

def deal_with_v(remainder_10)
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

	
puts "Enter a number between 1 and 100."
user_number = gets.chomp
number = user_number.to_i
if number <= 0 || number > 100
	puts "Try again."
else 
	puts "This program will convert #{user_number} to an old school Roman numeral."
	convert_roman(number)
end
