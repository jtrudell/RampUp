# Create a Guess Who Game. Rampup Lab class #4.
# Jen Trudell April 9, 2014


#You have 3 chances. 
#It should show a list of the suspects and the user are prompted to choose an attribute of hair color, eye color, skin color, or gender. 
#let the user enter a color/gender. 
#If guilty suspect doesn’t match the color/gender then remove the suspects of that color/gender
#If guilty suspect matches the color/gender then remove the suspects that are NOT that color/gender.
#Show an updated list of suspects
#User makes a guess by suspect name
#If guess is wrong. Remove the guessed suspect from list. They have 2 more chances. repeat from 1 again. If guess is right. They Win.
#If they use up all their chances. Tell them who the guilty suspect is.


keys = ["name", "gender", "skin", "hair", "eye"] 
values = [ 
	[ "rachel", "girl", "black", "auburn", "brown"], 
	[ "mac", "boy", "white", "black", "brown"],
	[ "nick", "boy", "white", "brown", "blue"],
	[ "angie", "girl", "white", "auburn", "green"], 
	[ "theo", "boy", "white", "blonde", "brown"],
	[ "joshua", "boy", "white", "black", "brown"],
	[ "emily", "girl", "white", "blonde", "blue"],
	[ "jason", "boy", "white", "blonde", "green"],
	[ "john", "boy", "white", "brown", "blue"],
	[ "grace", "girl", "black", "black", "brown"],
	[ "jake", "boy", "white", "brown", "brown"],
	[ "megan", "girl", "white", "blonde", "green"],
	[ "ryan", "boy", "white", "auburn", "brown"],
	[ "brandon", "boy", "white", "blonde", "brown"],
	[ "beth", "girl", "white", "blonde", "brown"],
	[ "diane", "girl", "black", "brown", "brown"],
	[ "chris", "boy", "white", "black", "green"],
	[ "david", "boy", "black", "black", "brown"],
	[ "michelle", "girl", "black", "brown", "brown"],
	[ "tyson", "boy", "black", "black", "brown"],
	[ "ursula", "girl", "white", "auburn", "green"]
		]

suspects = Hash[*keys.zip(values).flatten]
puts suspects
