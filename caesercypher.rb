# Alternative final project for Rampup Class that I worked on after 
# class ended. Jen Trudell May 14, 2015

# Caeser Cipher is type of substitution cipher in which each letter 
# is replaced by a letter some fixed number of positions down the alphabet. 
# For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. 

class Cipher

	attr_accessor :phrase, :key

	def initialize(phrase, key)
		@phrase = phrase
		@key = key
	end

	# method uses "next" which only allows encryption with an offset to the right
	
	# def encrypt
	# 	puts "'#{@phrase}' encrypted with an offset of #{@key} to the right is: "
	# 	@phrase.each_char do |letter|
	# 		@key.times do letter.next!
	# 		end
	# 		print letter
	# 	end
	# 	puts ""
	# end

	# methord uses .ord (the ordinal equivalent of a char) and .chr (the char equivalent of a number), so 
	# can offset right (positive key) or left (negative key)
	def encrypt
		puts "'#{@phrase}' encrypted with an offset of #{@key} is: "
		@phrase.each_char do |letter|
			letter_place = letter.ord # ordinal number of letter
			letter_moved = letter_place + @key # ordinary number of letter plus the key
			print letter_moved.chr # ordinal number of letter_moved converted to a character
		end
			puts ""
	end

	def decrypt
		puts "#{@phrase} decrypted with the key you provided is: "
			@phrase.each_char do |letter|
			letter_place = letter.ord 
			letter_moved = letter_place - @key 
			print letter_moved.chr 
		end
		puts ""
	end
end

puts "Enter the phrase you want to encrypt:"
print ">> "
phrase = gets.chomp

puts "Enter the key (any positive or negative number between 1-9): "
print ">> "
key = gets.chomp.to_i

encrypted_phrase = Cipher.new(phrase, key)

encrypted_phrase.encrypt

puts "What phrase would you like to decrypted?"
decrypt_phrase = gets.chomp

puts "What is the key?"
decrypt_key = gets.chomp.to_i

decrypted_phrase = Cipher.new(decrypt_phrase, decrypt_key)

decrypted_phrase.decrypt
