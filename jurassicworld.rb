# In-class exercise April 27, 2015

require './animal.rb'

class TRex
	include Dinosaur

	def intro
		puts "I'm a TRex."
		puts
	end
end

class Human
	attr_accessor :name
	include Mammal

	def initialize(name)
		@name = name
	end

	def intro
		puts "My name is #{@name} and I'm an unlucky person."
	end
end

jen = Human.new("Jen")

dino = TRex.new

puts "------------------"
puts "#{jen.name}:"
jen.intro
puts ""
puts "Dinosaur:"
dino.intro
dino.move
dino.eat
puts ""
puts "#{jen.name}:"
jen.move
jen.breathe
puts ""
puts "Dinosaur: "
puts "Not for long!"
dino.kill
puts ""
puts "#{jen.name}:"
jen.kill
puts ""