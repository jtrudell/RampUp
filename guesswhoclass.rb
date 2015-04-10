# Create a Guess Who Game. Rampup Lab class #4.
# Jen Trudell April 9, 2014


#If guilty suspect doesn’t match the color/gender then remove the suspects of that color/gender
#If guilty suspect matches the color/gender then remove the suspects that are NOT that color/gender.
#Show an updated list of suspects
#User makes a guess by suspect name
#If guess is wrong. Remove the guessed suspect from list. They have 2 more chances. repeat from 1 again. If guess is right. They Win.
#If they use up all their chances. Tell them who the guilty suspect is.

class Suspect

include Math

attr_reader :name, :gender, :skin_tone, :hair_color, :eye_color, :criminal_name


 def initialize (name, gender, skin_tone, hair_color, eye_color)
 	@name = name
 	@gender = gender
 	@skin_tone = skin_tone
 	@hair_color = hair_color
 	@eye_color = eye_color
 end

 def criminal_name
 @criminal_name = rand(@name)
end

def what_gender
	if @gender == "girl"
		puts "girl"
	elsif @gender == "boy"
		puts "boy"
	else puts "That's a new one!"
	end 
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

suspects = ["rachel", "mac", "nick", "angie", "theo", "joshua", "emily", "jason", "john", "grace", "jake", "megan", "ryan", 
		"brandon", "beth", "diane", "chris", "david", "michelle", "tyson", "ursula"]

$counter = 3

def prompt
	print ">> "
end


puts "You are playing 'Guess Who?'" 
puts "Someone committed a crime. You have three chances to guess the name of the criminal."
puts "The names of the suspects are: " 
puts suspects.join(",") 
puts "Do you think the criminal is a girl or a boy? Enter girl or boy."
print prompt
gender_guess = gets.chomp
puts tyson.criminal_name 

