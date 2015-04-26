# Exercise 8.3 from Chris Pine "Learn to Program" Ruby book.
# Type in as many words as you want until you hit enter 
# on an empty line. Adds those words to your array and 
# then prints out words in alphabetical order. If you
# didn't type in any words and just hit enter, it tells
# you that.
# Jeanette Trudell March 18, 2015

word_array = []

puts "Add some words, hitting enter after each word. When you are finished, hit enter."

words = true
while words != ""
words = gets.chomp
word_array.push words
end

unless word_array.first == "" 
puts "Here are the words you added in alphabetical order:"
puts word_array.sort
else
puts "You didn't enter any words."
end
