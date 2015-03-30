# practice with methods, if/else, recursion
# Jen Trudell March 20, 2015

def helpful_friend()
	puts "How are you feeling today?"
	feeling = gets.chomp.downcase
	if feeling == "sad" || feeling == "bad"
		puts "Oh no! I hope you feel better soon."
		puts "Let's do some math until you feel better."
		puts "Enter a number:"
		num1=gets.chomp.to_i
		puts "Enter another number:"
		num2=gets.chomp.to_i
		puts "Would you like to add or subtract?"
		what_do=gets.chomp.downcase
		if what_do == "add"
			num_add = num1 + num2
			puts "Ok #{num1} plus #{num2} equals #{num_add}"
		elsif what_do == "subtract"
			num_subtact = num1 - num2
			puts "Ok. #{num1} minus #{num2} equals #{num_subtact}"
		else
			puts "Uh that's not what I asked. Let's try again."
			helpful_friend
		end
	elsif feeling =="happy" || feeling == "good"
		puts "Yay! Glad to hear it."
	else 
		puts "Hmm, let's talk more."
		helpful_friend()
	end
end

helpful_friend