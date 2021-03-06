#Lab work class 3, Startup Institute Rampup.
#Jen Trudell April 1, 2015

#Startup Institute lab, class 3: Build an application that can encrypt and decrypt a string. For example:
#encrypt(“This is a secret”) should return something like “jhsdakha%j3jb” .You should also be able to decrypt the encrypted message.
#decrypt(“jhsdakha%j3jb”) it should return “This is a secret”.

puts "Enter a phrase to encrypt:"
phrase = gets.chomp.downcase
phrase_array = phrase.split("")
puts # blank line

# creats hash that assigns random numbers/letters to a-z, ' and one empty space
encrypt_hash = {
"a" => 5,
"b" => "v",
"c" => 8,
"d" => "j",
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

# encrypts the phrase
encrypted_array = []
phrase_array.each do |x|
	y = encrypt_hash.fetch(x)
	encrypted_array.push(y)
end

encrypted_string = encrypted_array.join("")
puts "Now I will encrypt #{phrase}:" 
puts "Encrypted: #{encrypted_string}"
puts # blank line

# decrypts the encrypted string 
decrypted_array = []
encrypted_array.each do |x|
	y = encrypt_hash.key(x)
	decrypted_array.push(y)
end

decrypted_string = decrypted_array.join("")

puts "Now I will decrypt #{encrypted_string}:" 
puts "Decrypted: #{decrypted_string}" 