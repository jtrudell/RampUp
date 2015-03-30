# Creat a program (without using .sort method) to
# sort words alphabetically. Exercise from Section 10.2
# of Chris Pine's "Learn to Program" Ruby book.
# (probably didn't intend you to use .min/.max either...)
# Jen Trudell March 26, 2014



# ask user for a list of words
puts "Enter a list of words, separated by commas. Hit enter when done."
puts "This program will sort your words alphabetically."
word_list = gets.chomp.downcase

# convert word list into an array
word_array = word_list.split(", ")

# define methord sort_words, which takes an array of words and finds the smallest word 
# (i.e., the first alphabetically) and puts it into a sorted array and deletes the 
# smallest word from the words array. Does this until the words array is empty. Then 
# converts the sorted array into a string and puts the string.

def sort_words (words)

	# initialize arrays
	sorted_array = [] if sorted_array.nil?
	words = [] if words.nil?

	until words.length == 0
		first_word = words.min
		words.delete(first_word)
		sorted_array.push(first_word) 
	end
	
		sorted_words = sorted_array.join(", ")
		puts sorted_words
end

sort_words(word_array)
