#private methods, only accessable by objects of same class

class Person

	def say_word(word)
		puts "#{word}"
	end

	def say_secret_word
		puts secret_word
	end

	private
	def secret_word
		"this is a secret"
	end

end

person = Person.new
person.say_word("hello")
person.say_secret_word #this runs a public method that calls the private method, which works fine
puts person.secret_word #this is a direct call of the private method and gives you an error

#protected methods, more lenient than private methods. acccessible by objects of same class and subclass. 
#so if you had a protect method in Person, would be accessible by subclass of Person like class Woman.

protected
def secreted
	"this is a secret"
end