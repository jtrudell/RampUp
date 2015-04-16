# Lab for Week 5 of Startup Institute RampUp
# Jen Trudell April 15, 2015

#Directions:
# Let’s build a simple Blackjack game. You will have a dealer and a player. There will only be one deck of cards. 
# Aces are set to 1 and it does not have to support 11. Suits and face cards does not need to be supported either. 
#Rules of the game:
# Player and Dealer gets two cards each. Player sees both their cards and can only see one of the dealer cards. 
# Player has a choice to hit or stay. When player hits, player get another card. If player is over 21, player automatically lose. 
# If player is under 21. You continue to ask if they want to hit or stay. Once you stay. It is the dealer’s(automated) turn. 
# The rule for the dealer is this: Dealer MUST hit until they get to 17 or above. If they are at 17 or above they MUST stay. 
# If dealer goes over 21 they automatically lose. If both the player and dealer are under 21 the one closest to 21 wins.

#Bonus: 
# Support face cards, Support Aces with 1 and 11. Have multiple decks. Support a bankroll and wager amount.

#General Rules of Black Jack:
# 1. A card is dealt, face up, to each player in turn and then one to the dealer. 
# 2. The dealer's card is face down and called the "hole" card.
# 3. A second card is then dealt, again face up, to each player.
# 4. Starting from the player to the left of the dealer, each player decides whether to draw further cards.
# 5. After all players have completed their hands, the Dealer proceeds to draw cards to complete the Dealer's hand.
# You win if:
# => Your total is higher than the Dealer's total
# => The Dealer goes over 21 or "busts" (provided you have not previously busted yourself).
# If your total is the same as the Dealer's total it is a "stand-off" and you neither win nor lose.
# You lose if you "bust" (go over 21), or the Dealer's total is greater.



class Person
	attr_accessor :name, :hole_card, :hit, :stay, :points
end

class Card
	attr_accessor :name, :value

	def initialize(name, value)
		@name = name
		@value = value
	end
end

class Deck < Card
	attr_accessor :name, :cards, :player_hand, :dealer_hand

	def initialize(name, cards, player_hand, dealer_hand)
		@name = name
		@cards = cards
		@player_hand = player_hand
		@deal_hand = dealer_hand
	end

	def card_name
		cards.each do |i|
		puts i.name
		end
	end
	
	def card_value
		cards.each do |i|
		puts i.value
		end
	end

	def deal_card(person, person_hand)
		x = cards.pop
		person_hand << x
		puts "Dealt card #{x.name} to #{person.name}."
	end 

	def hole_card(person, dealer_hand)
		x = cards.pop
		dealer_hand << x
		puts "Dealt hole card to #{person.name}."
	end
end

def show_hand(hand)
	hand.each do |i|
	puts i.name
	end
end

dealer = Person.new
player = Person.new
dealer.name = "Dealer"
player.name = "Jen"

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

standard_deck = [ace, ace, ace, ace, card_two, card_two, card_two, card_two, card_three, card_three, card_three, card_three, 
				card_four, card_four, card_four, card_four, card_five, card_five, card_five, card_five, card_six, card_six, card_six, card_six, 
				card_seven, card_seven, card_seven, card_seven, card_eight, card_eight, card_eight, card_eight, card_nine, card_nine, card_nine, 
				card_nine, card_ten, card_ten, card_ten, card_ten, jack, jack, jack, jack, queen, queen, queen, queen, king, king, king, king]


player_hand = Array.new
dealer_hand = Array.new
		
deck = Deck.new("deck 1", standard_deck.shuffle, player_hand, dealer_hand)
 
deck.card_name


deck.deal_card(dealer, dealer_hand)
deck.deal_card(player, player_hand)


deck.hole_card(dealer, dealer_hand)


deck.card_name

puts "break"

puts deck.show_hand(player_hand)



