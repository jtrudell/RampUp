# RampUp In-Class Exercise March 23, 2015.
# User has 5 chances to guess a randomly generated 
# number between 1 and 100.

number = rand(100)
user_guess = 0
i = 0

while user_guess != number && i <= 4
puts "Choose a number between 1 and 100. You have 5 chances to guess the number."
user_guess = gets.chomp 

	if user_guess == number
		puts "You guessed the number! Congratulations, it was #{number} which is the same as your guess: #{user_guess}".
		break

	else
		i += 1
		puts "Wrong answer. Try again."
		puts #blank line
	
	end
end 	

puts "You have no more chances. The answer was #{number}."