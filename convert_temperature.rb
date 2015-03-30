# Program that asks user to input celsius (or fahrenheit) 
# and converts it to fahrenheit (or celsius). Did this by
# creating two methods (one method to convert F to C, the other 
# to convert C to F).
# Jeanette Trudell March 18, 2015

def fahrenheit_to_celsius(f)
	c = (f - 32) / 1.8
end

def celsius_to_fahrenheit(c)
	f = (c * 1.8) + 32
end

# initializes variable
answer = 0

while answer != "Fahrenheit" || answer != "Celsius"
	puts "This program converts Celsius to Fahrenheit or Fahrenheit to Celsius. Would you like to convert from Celsius or from Fahrenheit?"
	answer = gets.chomp.capitalize

	if answer == "Fahrenheit" || answer == "Celsius"
		puts "Ok. Please enter the termperature (number only)."
		input_temperature = gets.chomp.to_f
		if answer == "Fahrenheit"
			convert_to_C = fahrenheit_to_celsius(input_temperature)
			puts "#{input_temperature} degrees Fahrenheit is #{convert_to_C} degrees Celsius."
			break
		else 
			convert_to_F = celsius_to_fahrenheit(input_temperature)
			puts "#{input_temperature} degrees Celsius is #{convert_to_F} degrees Fahrenheit."
			break
		end

	else puts "Please enter the word \'Fahrenheit\' or the word \'Celsius\'."
		puts # adds blank line to make program read more clearly if user doesn't enter Fahrenheit or Celsius and program loops back to initial question.
	end
end


		