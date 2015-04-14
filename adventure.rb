
class Path
#  @name
#  @num_of_weapons
#  @health
#  @direction

#def num_of_enemies

#  end
end

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

def power #(between weapons and heros, weapon and enemies)

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



blurghero = Hero.new("blurghero", 100, 100)
badguy = Enemy.new("badguy", 100, 100)
axe = Weapon.new("axe", 5)

battle(blurghero, badguy)

