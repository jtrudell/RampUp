class Person

attr_accessor :name, :age, :gender, :language, :mad_skillz

	def initialize(name, age, gender)
		@name = name
		@age = age
		@gender = gender
	end

	def introduction
		puts "Hi, my name is " + name + "."
	end

	def speech
		puts "I speak " + language + "."
	end

	def specialty
		puts "I rock at " + mad_skillz + "."
	end 

end

Jim = Person.new("Jim", 37, "male")
Bob = Person.new("Bob", 43, "male")
Sally = Person.new("Sally", 55, "female")


Sally.introduction
Bob.introduction
Sally.language = "English"

Sally.speech

Bob.mad_skillz = "mini golf"
Bob.specialty

puts Jim.age

puts (Jim.age - Sally.age)