#Lab work class 3, Startup Institute Rampup.
#Jen Trudell April 2, 2015

#same as encryptmethod2.rb only this one uses a global hash variable and two methods (encrypt and decrypt) 

# creats global hash that assigns random numbers/letters to a-z, ' and one empty space.
# I realize I shouldn't be using a global variable. One day I will figure out modules/instance variables.

	$encrypt_hash = {
	"a" => "5",
	"b" => "v",
	"c" => "8",
	"d" => "j",
	"e" => "m",
	"f" => "l",
	"g" => "6",
	"h" => "1",
	"i" => "i",
	"j" => "2",
	"k" => "a",
	"l" => "u",
	"m" => "7",
	"n" => "x",
	"o" => "s",
	"p" => "b",
	"q" => "r",
	"r" => "4",
	"s" => "e",
	"t" => "k",
	"u" => "o",
	"v" => "3",
	"w" => "f",
	"x" => "g",
	"y" => "9",
	"z" => "t",
	" " => "p",
	"'" => "n"
	}

def encrypt(user_phrase)
	
	# encrypts user_phrase 
	phrase_array = user_phrase.split("")
	encrypted_array = []
	phrase_array.each do |x|
		y = $encrypt_hash.fetch(x)
		encrypted_array.push(y)
		end
	encrypted_string = encrypted_array.join("")
	puts "Now I will encrypt '#{user_phrase}':" 
	puts "Encrypted: #{encrypted_string}"
	puts # blank line
end

def decrypt(encrypted_phrase)
	
	# decrypts encrypted_phrase 
	encrypted_array = encrypted_phrase.split("")
	decrypted_array = []
	encrypted_array.each do |x|
		y = $encrypt_hash.key(x.to_s)

		decrypted_array.push(y)
	end

	decrypted_string = decrypted_array.join("")
	puts "Now I will decrypt '#{encrypted_phrase}':" 
	puts "Decrypted: #{decrypted_string}" 
	puts # blank line
end

puts "Enter a phrase to encrypt:"
phrase = gets.chomp.downcase
puts # blank line
encrypt(phrase)


puts "Enter an encrypted phrase to decrypt:"
encrypted_phrase = gets.chomp.downcase
puts # blank line
decrypt(encrypted_phrase)





