# Create a Guess Who Game. Rampup Lab class #4.
# Jen Trudell April 9, 2014


#If guilty suspect doesn’t match the color/gender then remove the suspects of that color/gender
#If guilty suspect matches the color/gender then remove the suspects that are NOT that color/gender.
#Show an updated list of suspects
#User makes a guess by suspect name
#If guess is wrong. Remove the guessed suspect from list. They have 2 more chances. repeat from 1 again. If guess is right. They Win.
#If they use up all their chances. Tell them who the guilty suspect is.

$counter = 3

$names = ["rachel", "mac", "nick", "angie", "theo", "joshua", "emily", "jason", "john", "grace", "jake", "megan", "ryan", 
		"brandon", "beth", "diane", "chris", "david", "michelle", "tyson", "ursula"]

$girls = ["rachel", "angie", "emily", "grace", "megan", "beth", "diane", "michelle", "ursula"]

$boys = ["mac", "nick", "theo", "joshua", "jason", "john", "jake", "ryan", "brandon", "chris", "david", "tyson"]

$tone_black = ["rachel", "grace", "diane", "david", "michelle", "tyson"]

$tone_white = ["mac", "nick", "angie", "theo", "joshua", "emily", "jason", "john", "jake", "megan", "ryan", 
		"brandon", "beth", "chris", "ursula"]

$hair_black = ["mac", "joshua", "grace", "chris", "david", "tyson"]

$hair_brown = ["nick", "john", "jake", "diane", "michelle"]

$hair_auburn = ["rachel", "angie", "ryan", "ursula"]

$hair_blonde = ["theo", "emily", "jason", "megan", "brandon", "beth"]

$eyes_brown = ["rachel", "mac", "theo", "joshua", "grace", "jake", "ryan", "brandon", "beth", "diane", "david", "michelle", "tyson"]

$eyes_blue = ["nick", "emily", "john"]

$eyes_green = ["angie", "jason", "megan", "chris", "ursula"]

$suspects = []

$criminal = $names[rand(0..20)]

def prompt
	print ">> "
end

def list_names(characteristic)
	for i in characteristic do 
		puts i
	end
end

def suspect_gender
opposite_gender = " "
puts "Do you think a boy or a girl did it? Enter girl or boy."
prompt
gender_guess = gets.chomp
if gender_guess == "girl"
	opposite_gender = "boy"
else opposite_gender = "girl"
end
if gender_guess == "girl" && $girls.include?($criminal) == true
	$suspects << $girls
	puts "You are correct, the criminal is a girl. Here is the list of suspects: "
	list_names($suspects)
elsif 
 	 gender_guess == "boy" && $boys.include?($criminal) == true
	$suspects << $boys
	puts "You are correct, the criminal is a boy. Here is the list of suspects: "
	list_names($suspects)
elsif gender_guess != "boy" && gender_guess != "girl"
	puts "Please try again. Enter boy or girl next time."
	suspect_gender
else
	$counter -= 1  
	puts "You are wrong. The suspect is not a #{gender_guess}, the suspect is a #{opposite_gender}."
	if opposite_gender == "boy"
		$suspects << $boys
	else 
		$suspects << $girls
	end
	puts "Here is the list of suspects: "
	list_names($suspects)
end
end

def suspect_some_color
	if $counter == 0
		puts "You have no guesses left. Play again soon!"
	else
		puts "Do you want to guess the eye color, hair color or skin color of the suspect? Enter eye, hair or skin."
		color_type = gets.chomp
		if color_type == "eye"
			suspect_eye
		elsif color_type == "hair"
			suspect_hair
		elsif color_type == "skin"
			suspect_skin
		else
			puts "Please enter eye, hair or skin next time."
			suspect_some_color
		end
	end
end

def suspect_eye
	puts "Do you think the suspect has brown eyes, blue eyes or green eyes? Please enter brown, blue or green."
	color_guess = gets.chomp
	if color_guess == "brown" && $eyes_brown.include?($criminal)
		puts "You are right, the criminal has brown eyes."
		for i in $suspects do
			if $eyes_brown.include?(i) == true
			$suspects = $suspects.delete[i]
			end
			puts "The remaining suspects are: " 
		list_names($suspects)
		end
	
	elsif color_guess == "blue" && $eyes_blue.include?($criminal)
		puts "You are right, the criminal has blue eyes."
		for i in $suspects do
			if $eyes_blue.include?(i) == true
			$suspects = $suspects.delete[i]
			end
			puts "The remaining suspects are: " 
		list_names($suspects)
		end

	elsif color_guess == "green" && $eyes_green.include?($criminal)
		puts "You are right, the criminal has green eyes."
		for i in $suspects do
			if $eyes_green.include?(i) == false
			$suspects = $suspects.delete[i]
			end
			puts "The remaining suspects are: " 
		list_names($suspects)
		end

	elsif color_guess != "brown" && color_guess != "blue" && color_guess != "green"  
		puts "Plesae enter brown, blue or green next time."
		suspect_eye
	
	else
	$counter -= 1
	puts "You are wrong. The suspect does not have #{color_guess} eyes, and you have #{$counter.to_s} guesses left." 
	suspect_some_color	

	end
end
	
def suspect_hair
	puts "Do you think the suspect has black hair, brown hair, blonde hair or auburn hair? Please enter black, brown, blonde or auburn."
	color_guess = gets.chomp
	if color_guess == "black"
	elsif color_guess == "brown"
	elsif color_guess == "blonde"
	elsif color_guess == "auburn"
	else
		puts "Plesae enter black, brown, blonde or auburn next time."
		suspect_hair
	end
end		

def suspect_skin
	puts "Do you think the suspect has white skin or black skin? Please enter white or black."
	color_guess = gets.chomp
	if color_guess == "white"
	elsif color_guess == "black"
	else
		puts "Yes I agree this guestion is completely black and white (har har), but plese play along."
		puts "Please enter white or black next time."
		suspect_skin
	end
end

puts $criminal
puts "You are playing 'Guess Who?'" 
puts "Someone committed a crime. You have three chances to guess the name of the correct suspect."
puts "The suspects are: " 
list_names($names)
suspect_gender
puts "You have #{$counter.to_s} guesses left." 
suspect_some_color

