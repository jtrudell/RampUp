# Lab for Week 5 of Startup Institute RampUp
# Jen Trudell April 17, 2015

#Directions:
# Let’s build a simple Blackjack game. You will have a dealer and a player. There will only be one deck of cards. 
# Aces are set to 1 and it does not have to support 11. Suits and face cards do not need to be supported either. 
#Rules of the game:
# Player and Dealer gets two cards each. Player sees both their cards and can only see one of the dealer cards. 
# Player has a choice to hit or stay. When player hits, player gets another card. If player is over 21, player automatically loses. 
# If player is under 21, you continue to ask if they want to hit or stay. Once you stay, it is the dealer’s(automated) turn. 
# The rule for the dealer is this: Dealer MUST hit until they get to 17 or above. If they are at 17 or above they MUST stay. 
# If dealer goes over 21 they automatically lose. If both the player and dealer are under 21 the one closest to 21 wins.


class Card
	attr_accessor :name, :value

	def initialize(name, value)
		@name = name
		@value = value
	end
end

class BlackJack < Card
	attr_accessor :cards, :player_name, :dealer_name, :player_hand, :dealer_hand

	def initialize(cards, player_name, dealer_name, player_hand, dealer_hand)
		@cards = cards
		@player_name = player_name
		@dealer_name = dealer_name
		@player_hand = player_hand
		@deal_hand = dealer_hand
	end

	def hand_value(person, person_hand, answer=0)
		total = 0
		person_hand.each do |i|
		total += i.value
		end
		puts "#{person} has #{total} points."
		if total > 21
			puts "Bust! #{person} loses."
			self.show_hand(person, person_hand)
			exit
		elsif total == 21 
			puts "Black Jack! #{person} wins!"
			self.show_hand(person, person_hand)
			exit
		else
			if answer == "hit" #only a person can answer hit
			puts "#{person}, do you want to hit or stay?"
			answer_again = gets.chomp
			play(person, person_hand, answer_again)
			elsif answer == "dealer's choice" #only dealer automatically answer's dealer's choice if < 17
			play(person, person_hand)
			else
			puts "#{person} stays." #either person or dealer can stay
			end
		end
	end

	def show_hand(person, hand)
		x = Array.new
		hand.each do |i|
		x << i.name
		end
		print "#{person}'s hand: "
		puts x.join(", ")
	end

	def deal_card(person, person_hand)
		x = cards.pop
		person_hand << x
		puts "Dealt card #{x.name} to #{person}."
	end 

	def hole_card(person, dealer_hand)
		x = cards.pop
		dealer_hand << x
		puts "Dealt hole card to #{person}."
	end

	def play(person, person_hand, answer=0)
		if answer == "hit"
			puts "#{person} hits."
			deal_card(person, person_hand)
			self.hand_value(person, person_hand, answer)
		elsif answer == "stay"
			self.hand_value(person, person_hand, answer)
		else # if answer doesn't equal hit or stay, then dealer must be playing
			total = 0
			person_hand.each do |i|
			total += i.value
			end
			if total < 17
				puts "#{person} hits."
				deal_card(person, person_hand)
				self.hand_value(person, person_hand, answer = "dealer's choice")
			else 
				self.hand_value(person, person_hand, answer = "stay")
			end
		end
	end
		
	def who_won(player, dealer, dealer_hand, player_hand)
		player_total = 0
		player_hand.each do |i|
		player_total += i.value
		end
		dealer_total = 0
		dealer_hand.each do |i|
		dealer_total += i.value
		end
		if player_total > dealer_total
			puts "#{player} wins! #{player} has #{player_total} points, #{dealer} has #{dealer_total} points."
		elsif dealer_total > player_total
			puts "#{dealer} wins! #{dealer} has #{dealer_total} points, #{player} has #{player_total} points."
		else
			puts "Stand-off! #{dealer} has #{dealer_total} points, and #{player} also has #{player_total} points."
		end
	end

end

#create card objects
ace = Card.new("Ace", 1)
king = Card.new("King", 10)
queen = Card.new("Queen", 10)
jack = Card.new("Jack", 10)
card_ten = Card.new("10", 10)
card_nine = Card.new("9", 9)
card_eight = Card.new("8", 8)
card_seven = Card.new("7", 7)
card_six = Card.new("6", 6)
card_five = Card.new("5", 5)
card_four = Card.new("4", 4)
card_three = Card.new("3", 3)
card_two = Card.new("2", 2)

#create card array (i.e., a standard deck of cards)
standard_deck = [ace, ace, ace, ace, card_two, card_two, card_two, card_two, card_three, card_three, card_three, card_three, 
				card_four, card_four, card_four, card_four, card_five, card_five, card_five, card_five, card_six, card_six, card_six, card_six, 
				card_seven, card_seven, card_seven, card_seven, card_eight, card_eight, card_eight, card_eight, card_nine, card_nine, card_nine, 
				card_nine, card_ten, card_ten, card_ten, card_ten, jack, jack, jack, jack, queen, queen, queen, queen, king, king, king, king]


dealer = "Dealer"
player = "Jen"

player_hand = Array.new
dealer_hand = Array.new

#create new blackjack object (i.e., a new game with a deck, player, dealer, and hands of cards)
game = BlackJack.new(standard_deck.shuffle, player, dealer, player_hand, dealer_hand)
 
# 1. A card is dealt, face up, to each player in turn.
game.deal_card(player, player_hand)

# 2. A card is dealt to dealer. The dealer's card is face down and called the "hole" card.
game.hole_card(dealer, dealer_hand)

# 3. A second card is then dealt, again face up, to each player and face up to dealer.
game.deal_card(player, player_hand)
game.deal_card(dealer, dealer_hand)

# 4. Starting from the player to the left of the dealer, each player decides whether to draw further cards.
puts "#{player}, do you want to hit or stay?"
answer = gets.chomp
game.play(player, player_hand, answer)

# 5. After all players have completed their hands, the Dealer proceeds to draw cards to complete the Dealer's hand.
# In this lab, dealer has to hit until they get 17, then they stay.
game.play(dealer, dealer_hand)

#6. You win if: (1) Your total is higher than the Dealer's total or (2) The Dealer goes over 21 or "busts" 
#  (provided you have not previously busted yourself). If your total is the same as the Dealer's total it is a "stand-off" 
# and you neither win nor lose. You lose if you "bust" (go over 21), or the Dealer's total is greater.
game.who_won(player, dealer, dealer_hand, player_hand)


puts "-----------------"
print "#{player}'s hand: "
game.show_hand(player, player_hand)
print "#{dealer}'s hand: "
game.show_hand(dealer, dealer_hand)



