#Lab work class 3, Startup Institute Rampup.
#Jen Trudell March 30, 2015

#Build an application that can encrypt and decrypt a string. For example:

#encrypt(“This is a secret”)
#should return something like “jhsdakha%j3jb”

#You should also be able to decrypt the encrypted message.

#decrypt(“jhsdakha%j3jb”)
#it should return “This is a secret”

#Bonus: Implement a Caesar Cipher encryption which is a simple encryption method by shifting the letters down a certain number. You’ll need the encrypted string and the correct number shifted.
#encrypt(“this is a secret”, 5)
#http://en.wikipedia.org/wiki/Caesar_cipher

# Promput user to enter a string

puts "Enter the phrase to encrypt:"
phrase = gets.chomp

#Take the string and convert it to an array

encrypt_this = phrase.split("")

#Encrypt the array

##reverse array
encrypt_1 = encrypt_this.reverse
##adds a random number to the first position
encrypt_2 = encrypt_1.insert(0, (rand(1..2000)))
##inserts "fE4$ in position 2"
encrypt_3 = encrypt_2.insert(1, "fE4$")
##inserts random in position -1
encrypt_4 = encrypt_3.insert(-1, (rand(1..2000)))
#convers it to a string
encrypted = encrypt_4.join("")


#Put it back to the user as a string
puts "#{phrase} encrypted is:"
puts encrypted

#decrypt it

decrypted_1 = encrypt_4.delete_at(-1)
decrypted_2 = decrypted_1.delete("fE4$")
decrypted_3 = decrypted_2.delete_at(0)
decrypted_4 = decrypted_3.reverse
decrypted = decrypted_4.join("")


#puts it back decrypted
puts "#{encrypted} decrypted is #{decrypted}"





