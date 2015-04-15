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



class Dealer
	attr_accessor :name, :hole_card, :hand, :hit, :stay, :points

	def initialize(name, hole_card, hand, hit, stay, points)
		@name = name
		@hole_card = hole_card
		@hand = hand
		@hit = hit
		@stay = stay
		@points = points
	end
end

class Player
	attr_accessor :name, :hand, :hit, :stay, :points

	def initialize(name, hand, hit, stay, points)
		@name = name
		@hand = hand
		@hit = hit
		@stay = stay
		@points = points
	end
end

class Deck
	attr_accessor :name, :number, :ace, :face_card, :regular_card

	def initialize(name, number, ace, face_card, regular_card)
		@name = name
		@number = number
		@ace = ace
		@face_card = face_card
		@regular_card = regular_card
	end

end
