# In-class exercise April 27, 2015

module Mammal
	def breathe
		puts "I breathe air."
	end

	def move
		puts "I run from Dinosaurs."
	end

	def kill
		puts "Behold! I can control fire and destroy you!"
	end
end

module Dinosaur
	def eat
		puts "I eat Mammals."
	end

	def move
		puts "I chase Mammals."
	end

	def kill
		puts "Prepare to die."
	end
end