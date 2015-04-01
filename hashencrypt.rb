#Lab work class 3, Startup Institute Rampup.
#Jen Trudell March 30, 2015

#Build an application that can encrypt and decrypt a string. For example:
#encrypt(“This is a secret”) should return something like “jhsdakha%j3jb”

#You should also be able to decrypt the encrypted message.
#decrypt(“jhsdakha%j3jb”) it should return “This is a secret”

#Bonus: Implement a Caesar Cipher encryption which is a simple encryption method by shifting the letters down a certain number. You’ll need the encrypted string and the correct number shifted.
#encrypt(“this is a secret”, 5)
#http://en.wikipedia.org/wiki/Caesar_cipher



puts "Enter a phrase to encrypt:"
phrase = gets.chomp.downcase
phrase_array = phrase.split("")

# creats hash that assigns random numbers/letters to a-z, ' and one empty space
def encrypto (key)
encrypt_hash = {
"a" => 5,
"b" => "v",
"c" => 8,
"d" => "f",
"e" => "m",
"f" => "l",
"g" => 6,
"h" => 1,
"i" => "i",
"j" => 2,
"k" => "a",
"l" => "u",
"m" => 7,
"n" => "x",
"o" => "s",
"p" => "b",
"q" => "r",
"r" => 4,
"s" => "e",
"t" => "k",
"u" => "o",
"v" => 3,
"w" => "f",
"x" => "g",
"y" => 9,
"z" => "t",
" " => "p",
"'" => "n"
}

encrypted_array = []

y = encrypt_hash.fetch(key)
encrypted_array.push(y)
encrypted_string = encrypted_array.join("")
puts "Encrypted: #{encrypted_string}"



end

# encrypts user input based on hash
def encrypted(phrase)
	encrypted_string = ""
	phrase.each do |x|
	encrypto(x)
		end
end

encrypted(phrase_array)

# decrypts the encrypted string 
decrypted_array = []
encrypted_array.each do |x|
	y = encrypt_hash.key(x)
	decrypted_array.push(y)
end

decrypted_string = decrypted_array.join("")

puts "Now I will decrypt #{encrypted_string}:" 
puts "Decrypted: #{decrypted_string}" 