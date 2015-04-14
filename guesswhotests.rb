# Create a Guess Who Game. Rampup Lab class #4.
# Jen Trudell April 13, 2015
# V 2.0: Improves on guesswhoclass.rb aka v 1.0

# Rules:
# If guilty suspect doesn’t match the color/gender then remove the suspects of that color/gender
# If guilty suspect matches the color/gender then remove the suspects that are NOT that color/gender.
# Show an updated list of suspects
# User makes a guess by suspect name
# If guess is wrong. Remove the guessed suspect from list. They have 2 more chances. repeat from 1 again. If guess is right. They Win.
# If they use up all their chances. Tell them who the guilty suspect is.

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

$criminal_generated = $suspects[rand(0..20)]

$counter = 3

def prompt
	print ">> "
end

def guesses_left
	if $counter == 1
		puts "You have 1 guess left."
  	else 
  		puts "You have #{$counter} guesses left."
  	end
end

def criminal_description
	puts "#{$criminal_generated.name} has #{$criminal_generated.hair_color} hair, #{$criminal_generated.eye_color} eyes and"
	puts "#{$criminal_generated.skin_tone} skin. #{$criminal_generated.name} did it!"
end

def list_suspects(suspects)
	suspects.each do |i|
		puts i.name
	end
end

def delete_suspects(guess, attribute)
	delete_something = Array.new
	for i in $suspects
		if i.attribute != guess
		  delete_something << i
		else 
		  dont_delete = Array.new
		  dont_delete << i
		  delete_something = $suspects - dont_delete
		end
	end
	$suspects = $suspects - delete_something
end

def the_end
	puts "Game over. The criminal is: #{$criminal_generated.name}"
	criminal_description
end

def guess_characteristics
	
	# gender guess
	puts "Guess the criminal's gender. Enter boy or girl."
	prompt
    gender_input = gets.chomp
    delete_suspects(gender_input)
	  if gender_input == $criminal_generated.gender
		
			delete_suspects(gender_input)
			puts "Good guess! The criminal is a #{gender_input}. Deleted all of the suspects that are not #{gender_input}s."
	  else gender_input != $criminal_generated.gender
			delete_suspects(gender_input)
			puts "The criminal is NOT a #{gender_input}. Deleted all of the suspects that are #{gender_input}s."
	  end

	# hair color guess
	puts "Guess the criminal's hair color. Enter black, brown, auburn or blonde."
	prompt
	hair_input = gets.chomp
	
	  if hair_input == $criminal_generated.hair_color
		delete_hair = Array.new
			for i in $suspects
				if i.hair_color != hair_input
				delete_hair << i 
				end
			end
			delete_suspects(delete_hair, gender)
			puts "Good guess! The criminal has #{hair_input} hair. Deleted all of the suspects that do not have #{hair_input} hair."
	  else hair_input != $criminal_generated.hair_color
		delete_hair = Array.new
			for i in $suspects
				if i.hair_color == hair_input
				delete_hair << i 
				end
			end
			delete_suspects(delete_hair, gender)
			puts "The criminal does NOT have #{hair_input} hair. Deleted all of the suspects that have #{hair_input} hair."
	  end

	# eye color guess
	puts "Guess the criminal's eye color. Enter brown, blue or green."
	prompt
	eye_input = gets.chomp

	  if eye_input == $criminal_generated.eye_color
		delete_eye = Array.new
			for i in $suspects
				if i.eye_color != eye_input
				delete_eye << i 
				end
			end
			delete_suspects(delete_eye)
			puts "Good guess! The criminal has #{eye_input} eyes. Deleted all of the suspects that do not have #{eye_input} eyes."
	  else eye_input != $criminal_generated.eye_color
		delete_eye = Array.new
			for i in $suspects
				if i.eye_color == eye_input
				delete_eye << i 
				end
			end
			delete_suspects(delete_eye)
			puts "The criminal does NOT have #{eye_input} eyes. Deleted all of the suspects that do have #{eye_input} eyes."
	  end

	# skin color guess
	puts "Guess the criminal's skin color. Enter black or white." 
	puts "(yeah I know, there should be more options, but I didn't make the rules.)"
	prompt
	skin_input = gets.chomp

	  if skin_input == $criminal_generated.skin_tone
		delete_skin = Array.new
			for i in $suspects
				if i.skin_tone != skin_input
				delete_skin << i 
				end
			end
			delete_suspects(delete_skin)
			puts "Good guess! The criminal has #{skin_input} skin. Deleted all of the suspects that do not have #{skin_input} skin."
	  else skin_input != $criminal_generated.skin_tone
		delete_skin = Array.new
			for i in $suspects
				if i.skin_tone == skin_input
				delete_skin << i 
				end
			end
			delete_suspects(delete_skin)
			puts "The criminal does NOT have #{skin_input} skin. Deleted all of the suspects that have #{skin_input} skin."
	  end
	guess_who
end

def guess_who
	if $counter > 0
	  puts "The remaining suspects are: "
	  list_suspects($suspects)
	  puts "Who do you think the criminal is?"
	  prompt
	  guess = gets.chomp
	  if guess == $criminal_generated.name
		puts "You're right! The criminal is #{$criminal_generated.name}."
		criminal_description
		puts "You're a winner!"
	  else
		$counter -= 1
		if $counter == 0
			puts "Wrong, the criminal is not #{guess}."
			the_end
		else
		puts "Wrong, the criminal is not #{guess}, and #{guess} has been deleted from the list of suspects."
		wrong_suspect = Array.new
		  $suspects.each do |i|
			if i.name == guess
			wrong_suspect << i 
			end
		  end
		  delete_suspects(wrong_suspect)
  		  guesses_left
  		  guess_characteristics
  		end
	  end
	else
		the_end
	end
end

puts "You are playing 'Guess Who?'" 
puts "Someone committed a crime. You will have three chances to guess the name of the criminal."
puts "The names of the suspects are: " 
list_suspects($suspects)
puts "The suspects are identifiable by their gender, skin color, hair color, and eye color."
guess_characteristics

# TESTING NAME IS RIGHT 
#puts "FOR TESTING ONLY::The criminal is: #{$criminal_generated.name}"