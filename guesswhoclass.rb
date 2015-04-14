# Create a Guess Who Game. Rampup Lab class #4.
# Jen Trudell April 11, 2015
# V 1.0: OVERLY COMPLICATED, TWO MANY GLOBAL VARIABLES, DOESN'T FOLLOW BELOW RULES RE GUESSING GENDER/COLOR ALL AT ONCE.
# SEE V 2.0 GUESSWHOFINAL.RB


#If guilty suspect doesn’t match the color/gender then remove the suspects of that color/gender
#If guilty suspect matches the color/gender then remove the suspects that are NOT that color/gender.
#Show an updated list of suspects
#User makes a guess by suspect name
#If guess is wrong. Remove the guessed suspect from list. They have 2 more chances. repeat from 1 again. If guess is right. They Win.
#If they use up all their chances. Tell them who the guilty suspect is.

class Suspect

  attr_reader :name, :gender, :skin_tone, :hair_color, :eye_color, :criminal_name

  def initialize (name, gender, skin_tone, hair_color, eye_color)
 	@name = name
 	@gender = gender
 	@skin_tone = skin_tone
 	@hair_color = hair_color
 	@eye_color = eye_color
  end

end

rachel = Suspect.new("rachel", "girl", "black", "auburn", "brown") 
mac = Suspect.new("mac", "boy", "white", "black", "brown")
nick = Suspect.new("nick", "boy", "white", "brown", "blue")
angie = Suspect.new("angie", "girl", "white", "auburn", "green") 
theo = Suspect.new("theo", "boy", "white", "blonde", "brown")
joshua = Suspect.new("joshua", "boy", "white", "black", "brown")
emily = Suspect.new("emily", "girl", "white", "blonde", "blue")
jason = Suspect.new("jason", "boy", "white", "blonde", "green")
john = Suspect.new("john", "boy", "white", "brown", "blue")
grace = Suspect.new("grace", "girl", "black", "black", "brown")
jake = Suspect.new("jake", "boy", "white", "brown", "brown")
megan = Suspect.new("megan", "girl", "white", "blonde", "green")
ryan = Suspect.new("ryan", "boy", "white", "auburn", "brown")
brandon = Suspect.new("brandon", "boy", "white", "blonde", "brown")
beth = Suspect.new("beth", "girl", "white", "blonde", "brown")
diane = Suspect.new("diane", "girl", "black", "brown", "brown")
chris = Suspect.new("chris", "boy", "white", "black", "green")
david = Suspect.new("david", "boy", "black", "black", "brown")
michelle = Suspect.new("michelle", "girl", "black", "brown", "brown")
tyson = Suspect.new("tyson", "boy", "black", "black", "brown")
ursula = Suspect.new("ursula", "girl", "white", "auburn", "green")

$suspects = [rachel, mac, nick, angie, theo, joshua, emily, jason, john, grace, jake, megan, ryan, 
		brandon, beth, diane, chris, david, michelle, tyson, ursula]


$counter = 3

$boys = Array.new
for i in $suspects
	if i.gender == "boy"
$boys << i 
	end
end
	
$girls = Array.new
for i in $suspects
	if i.gender == "girl"
$girls << i 
	end
end

$black = Array.new
for i in $suspects
	if i.skin_tone == "black"
$black << i 
	end
end
	
$white = Array.new
for i in $suspects
	if i.skin_tone == "white"
$white << i 
	end
end

$criminal_generated = $suspects[rand(0..20)]

def prompt
	print ">> "
end

def the_end
	puts "Game over. The criminal is: #{$criminal_generated.name}"
end

def guesses_left
  if $counter == 0
	puts "You have no guesses left."
  elsif $counter == 1
	puts "You have 1 guess left."
  else 
	puts "You have #{$counter} guesses left."
  end
end

def list_suspects(suspects)
	for i in suspects
		puts i.name
	end
end

def remaining_suspects_guesses
	puts "The remaining suspects are: "
	list_suspects($suspects)
	guesses_left
end

def delete_suspects(characteristic)
	$suspects = $suspects - characteristic
end


def what_gender

	puts "Do you think the criminal is a girl or a boy? Enter girl or boy."
	prompt
	guess = gets.chomp
	if guess == "girl" && $criminal_generated.gender == "girl"
		puts "You are right, the criminal is a girl."
		delete_suspects($boys)
		remaining_suspects_guesses
	elsif guess == "boy" && $criminal_generated.gender == "boy"
		puts "You are right, the criminal is a boy."
		delete_suspects($girls)
		remaining_suspects_guesses
	else 
		$counter -= 1
		puts "Sorry, you are wrong. The criminal is a #{$criminal_generated.gender}."
		if $criminal_generated.gender == "girl"
			delete_suspects($boys)
			remaining_suspects_guesses
		else
			delete_suspects($girls)
			remaining_suspects_guesses
		end
	end 
end

def what_color
	if $counter > 0
	  puts "Choose whether to guess the criminal's skin color, eye color or hair color."
	  puts "Enter skin, eyes or hair."
	  prompt
	  color_characteristic = gets.chomp
	  what_characteristic(color_characteristic)
	else
		the_end
	end
end

def guess_who
	if $counter > 0
	  puts "Ok, who do you think the criminal is?"
	  puts "The remaining suspects are: "
			list_suspects($suspects)
	  prompt
	  guess = gets.chomp
	  if guess == $criminal_generated.name
		puts "You're right! The criminal is #{$criminal_generated.name}."
		puts "You won!"
	  else
		$counter -= 1
		puts "Sorry, the criminal is not #{guess}."
		$wrong_suspect = Array.new
		for i in $suspects
			if i.name == guess
			$wrong_suspect << i 
			end
		end
		delete_suspects($wrong_suspect)
		remaining_suspects_guesses
		what_color_or_guess
	  end
	else
		the_end
	end
end

def what_color_or_guess
	if $counter > 0
	  puts "Do you want to guess the name of the criminal, or guess the criminal's skin color, eye color or hair color?"
	  puts "Enter guess name or guess color."
	  prompt
	  choice = gets.chomp
	  if choice == "guess color"
		what_color
	  elsif choice == "guess name"
		guess_who
	  else
		puts "That is not an option."
		what_color_or_guess
	  end
	 else
	 	the_end
	end
end

def what_characteristic(characteristic)
  if $counter > 0
	
    if characteristic == "skin"
		puts "What color skin do you think the criminal has? Enter white or black."
		prompt
		guess = gets.chomp
		if guess == "white" && $criminal_generated.skin_tone == "white"
		puts "You are right, the criminal is white."
		delete_suspects($black)
		remaining_suspects_guesses
		what_color_or_guess
		elsif guess == "black" && $criminal_generated.skin_tone == "black"
		puts "You are right, the criminal is black."
		delete_suspects($white)
		remaining_suspects_guesses
	 	what_color_or_guess
	  else 
		$counter -= 1
		puts "Sorry, you are wrong. The criminal is #{$criminal_generated.skin_tone}."
		if $criminal_generated.skin_tone == "black"
			delete_suspects($white)
			remaining_suspects_guesses
			what_color_or_guess
		else
			delete_suspects($black)
			remaining_suspects_guesses
			what_color_or_guess
		end
	  end 
  
    elsif characteristic == "hair"
		puts "What color hair do you think the criminal has? Enter black, brown, auburn or blonde."
		prompt
		guess = gets.chomp
		if guess == $criminal_generated.hair_color
			puts "You are right. The criminal has #{guess} hair."
			$different_hair = Array.new
			for i in $suspects
				if i.hair_color != guess
				$different_hair << i 
				end
			end
			delete_suspects($different_hair)
			remaining_suspects_guesses
			what_color_or_guess
		else 
			$counter -= 1
			puts "Sorry, you are wrong. The criminal does not have #{guess} hair."
			$different_hair = Array.new
			for i in $suspects
				if i.hair_color == guess
				$different_hair << i 
				end
			end
			delete_suspects($different_hair)
			remaining_suspects_guesses
			what_color_or_guess
		end
    elsif characteristic == "eyes"
		puts "What color eyes do you think the criminal has? Enter brown, green or blue."
		prompt
		guess = gets.chomp
		if guess == $criminal_generated.eye_color
			puts "You are right. The criminal has #{guess} eyes."
			$different_eyes = Array.new
			for i in $suspects
				if i.eye_color != guess
				$different_eyes << i 
				end
			end
			delete_suspects($different_eyes)
			remaining_suspects_guesses
			what_color_or_guess
		else 
			$counter -= 1
			puts "Sorry, you are wrong. The criminal does not have #{guess} eyes."
			$different_eyes = Array.new
			for i in $suspects
				if i.eye_color == guess
				$different_eyes << i 
				end
			end
			delete_suspects($different_eyes)
			remaining_suspects_guesses
			what_color_or_guess
		end
    else 
		puts "That is not an option. Please enter skin, eyes or hair."
		what_color_or_guess
	end 
  else 
  	the_end
  end
end

puts "You are playing 'Guess Who?'" 
puts "Someone committed a crime. You have three chances to guess the name of the criminal."
puts "The names of the suspects are: " 
list_suspects($suspects)
what_gender
what_color_or_guess

# TESTING NAME IS RIGHT 
puts "FOR TESTING ONLY::The criminal is: #{$criminal_generated.name}"