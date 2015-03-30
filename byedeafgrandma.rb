# Builds on deafgrandmar.rb. Deaf Grandma won't let you go
# until you shout "BYE" three times in a row.
# Jen Trudell March 24, 2015

def main_talk
prompt = "What do you want to say to Grandma?"

	while true 
		puts prompt
		talk_to_grandma = gets.chomp

  		if talk_to_grandma == talk_to_grandma.upcase && talk_to_grandma != "BYE".chomp
	  		print "NO, NOT SINCE " 
	  		puts (rand(1930..1980))
  		elsif talk_to_grandma == "BYE".chomp
  			puts prompt
  			talk_to_grandma = gets.chomp
  			if talk_to_grandma == "BYE".chomp
  			puts end_grandma
  			else puts main_talk
  			end
  		else puts "HUH?! SPEAK UP, SONNY!"
  		end
	end

end

def end_grandma
prompt = "What do you want to say to Grandma?"

puts prompt
talk_to_grandma = gets.chomp
	if talk_to_grandma == "BYE".chomp
		puts "LET'S TALK AGAIN SOON."
		exit
	else main_talk
	end
end

puts main_talk