# In-class exercise April 14, 2015.

class Hero
	attr_accessor :name, :health, :strength

	def initialize(name, health, strength)
		@name = name
		@health = health
		@strength = strength
	end
end

class Enemy
	attr_accessor :name, :health, :strength

	def initialize(name, health, strength)
		@name = name
		@health = health
		@strength = strength
	end
end

class Weapon
	attr_accessor :name, :damage

	def initialize(name, damage)
		@name = name
		@damage = damage
	end
end

class Path
	attr_accessor :name, :direction,:num_of_weapons, :health_points

	def initialize(name, direction, num_of_weapons, health_points)
		@name = name
		@direction = direction
		@num_of_weapons = num_of_weapons
		@health_points = health_points
	end
end

def power (character, weapon)
	power = character.strength * weapon.damage
	puts "#{character.name} has #{power} power using #{weapon.name}."
end

def battle (hero, enemy)
  puts "#{hero.name} and #{enemy.name} engage in battle!"
	if hero.strength > enemy.strength
		enemy.strength -= 5
		puts "#{hero.name} wins the battle! #{enemy.name}'s strength is reduced to #{enemy.strength}." 
	else 
		hero.strength -= 5
		puts "#{enemy.name} wins the battle! #{hero.name}'s strength is reduced to #{hero.strength}."
	end
end

def choose_path(path, character)
	puts "#{character.name} is walking #{path.direction} on #{path.name}."
end

our_hero = Hero.new("Our Hero", 100, 100)
bad_guy = Enemy.new("Bad Guy", 100, 50)
axe = Weapon.new("Axe", 5)
castle_lane = Path.new("Castle Lane", "North", 5, 20)

battle(our_hero, bad_guy)

power(our_hero, axe)

power(bad_guy, axe)

choose_path(castle_lane, our_hero)

