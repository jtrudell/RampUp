# Exercise from Section 7.5 of Chris Pine's
# "Learn to Program" intro to Ruby book.
# Jen Trudell March 17, 2015


prompt = "What do you want to say to Grandma?"

while true 
	puts prompt
	talk_to_grandma = gets.chomp

  if talk_to_grandma == talk_to_grandma.upcase
	  print "NO, NOT SINCE " 
	  puts (rand(1930..1951))
  else puts "HUH?! SPEAK UP, SONNY!"
  end

	if talk_to_grandma == "BYE".chomp
		break
	end

end