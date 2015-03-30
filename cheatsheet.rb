#
#METHODS:
#

#<----simple puts text
def name(argument1, argument2)
	puts "This is it: #{argument1} and #{argument2}"
end

name("Jen", "Trudell")

#<----simple add
def add_num(num1, num2)
	return num1 + num2
end

puts add_num(1, 2)

#<----complicated math and puts text
def calculate(value)
     return value * 100
end

# Call calculate method.
result1 = calculate(5)
result2 = calculate(10)
result3 = calculate(calculate(2))

print result1, "\n"
print result2, "\n"
print result3, "\n"

#SPLAT (for unknown number of args) and ITERATING IN A METHOD)
#
def what_up(greeting, *bros)
  bros.each { |bro| puts "#{greeting}, #{bro}!" }
end
 
what_up("What up", "Justin", "Ben", "Kevin Sorbo")


#RECURSION IN A METHOD
#
def check_sign(number)
  if number > 0 && number !=0
    "#{number} is positive"
  elsif number == 0
  	puts "#{number} is 0. I will add 1 to it and try again."
  	number += 1
  	check_sign(number)
  else
    "#{number} is negative"
  end        
end

puts check_sign(0)

#
#LOOPS
#

#<----.times Loops

5.times do
	puts "This is a simple loop."
end

3.times do |x|
	puts x
end

#<----while/until Loops

i = 10
while i < 50
    puts "i: ", i
    i += 10
end

#
#ARRAYS
#

my_array = [1, 2, 3, 4, 5]

puts my_array[2]
puts my_array.first
puts my_array.last
puts my_array.push(6)
my_array.delete(2)
my_array.delete("rock") #if my array used strings
puts my_array
puts my_array.reverse
['x', 'y', 'z'].index('x') #finds position of x in array 

[1,2,3,4,5].map { |i| i + 1 } 
# map transforms each element of an array)
# output 2, 3, 4, 5, 6
 
[1,2,3,4,5,6].select {|i| i % 2 == 0} 
# select finds certain elements of an array, in this case even numbers)
 
names = ['rock', 'paper', 'scissors', 'lizard', 'spock']
names.select{|i| i.length > 5} 
# spits out words longer than 5 characters)
 
names.delete_if{|i| i.length > 5} 
# deletes words longer than 5 characters)
                                                                                    

#<----looping over an array

my_array.each do |x|
	puts x * 3
end

#<------create an array from a string

my_string = "Hi how are you?"
my_new_array = my_string.split(" ")
puts my_new_array

#<------create a string from an array

my_new_string = my_new_array.join(" ")


#<-------put new stuff in array if certain conditions met

def my_array(source)
  destination = []
  my_array.each do |number|
    # Add number to destination if number
    # is less than 4
    destination << number if number < 4
  end
  return destination
end
 
#
#HASHES
#

#<-------create a hash (keys => values OR :keys, values)/ get stuff out of it

restaurant_menu = {"Ramen" => 3, "Dal Makhani" => 4, "Tea" =>2}
 
chuck_norris = Hash[:punch, 99, :kick, 98, :stops_bullets_with_hands, true]
p chuck_norris

Hash.new 

restaurant_menu["Ramen"] returns value of ramen

restaurant_menu.keys 
#gets you all the keys. 

restaurant_menu.values 
#gets you all the values.



#<-------------add/change stuff in hash:
 
restaurant_menu["Dal Makhani"] = 4.5 
#if Dal wasn't there before, this would add it, if it was, would change value to 4.5
 
#<-----------------Iterating over hash
restaurant_menu.each do | item, price |
  puts "#{item}: $#{price}"
end
  
#
#MISCELLANEOUS
#


1.next
1.even?
1.methods (will list out all the methods you can call on an integer)
1.methods.sort (will sort all the methods)
puts 1.is_a?(Integer)
puts 1.is_a?(String)
'RubyMonk'.length
'RubyMonk'.include?("Ruby")
'RubyMonk'.start_with?("Ruby")
'RubyMonk'.index("R") finds positions in string of R

"this is a string".sub("This", "That") 
#replaces this with that (sub replaces first occurrence, gsub replaces all)

"or you can do this with a Regular Expressions (RegEx) (which matches particular characters/words/patterns of characters)".gsub(/[aeiou]/, '1')
"or use this to find a letter next to an empty space".match(/ ./)
 
 
2.between? 1, 3 
#is 2 between 1 and 3?
 
#Ternary operator (means "composed of three items", short hand for if-then-else construct. ? means "then" and : means "else"
def check_sign(number)
  number > 0 ? "#{number} is positive" : "#{number} is negative"
end''
 
#complex variable assignments 

def mymethod (something)
 balls = 20 + something
 players = 3 + something
 return balls, players
 end 
 
 puts mymethod(5)
 
 myballs, myplayers = mymethod(10) #assigns myballs and myplayers to balls and players in mymethod
 
 
 puts "i have #{myballs} balls."
 
 puts "i have %s balls and %s players" % mymethod(5) #assigns first s to balls and second s to players from my method
 
 puts "%s %s" %["i love", "cake"] #assigns first s to "I love" and second s to "cake"
 
 

 
