# messing arounds with defining methods and arrays.
# March 18, 2015

def greeting(hi, bye)
puts "#{hi} and #{bye} to you, too!"
end

puts "Well hello there!"
answer = gets.chomp
puts "Is that all you have to say?"
response = gets.chomp
greeting(answer, response)

array_pick = 4
my_array = ["cheese", "fruit", "pickles"]
while array_pick < 0 || array_pick > 3
	puts "Pick a number between 0 and 2"
	array_pick = gets.chomp.to_i
	puts my_array[array_pick]
end