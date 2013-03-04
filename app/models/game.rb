class Game < ActiveRecord::Base

	def simulate_player1(draw)
		hole1 = [draw[0], draw[1]]
		puts "Hole cards for player1 are #{hole1[0]} and #{hole1[1]}"
		puts "Suited" if hole1[1][1] == hole1[0][1]
		puts "Pocket Pair" if hole1[0][0] == hole1[1][0]
		return @hole1
	end

	def simulate_player2(draw)
		hole2 = [draw[2], draw[3]]
		puts "Hole cards for player2 are #{hole2[0]} and #{hole2[1]}"
		puts "Suited" if hole2[1][1] == hole2[0][1]
		puts "Pocket Pair" if hole2[0][0] == hole2[1][0]
	end

	def simulate_flop(draw)
		flop = [draw[47], draw[48], draw[49]]
		puts "The flop is #{flop[0]}, #{flop[1]}, #{flop[2]}"
		return flop
	end

	def simulate_turn_card(draw)
		turn_card = draw[50]
		puts "The turn card is #{turn_card}"
		return turn_card
	end

	def simulate_river_card(draw)
		river_card = draw[51]
		puts "The river card is #{river_card}"
		return river_card
	end

	def eval_player_hand(hole, flop, turn_card, river_card)
		raw_seven = [hole[0], hole[1], flop[0], flop[1], flop[2], turn_card, river_card]
		puts "Player1's seven cards #{raw_seven[0]}, #{raw_seven[1]}, #{raw_seven[2]}, #{raw_seven[3]}, #{raw_seven[4]}, #{raw_seven[5]}, #{raw_seven[6]}"
		puts "FLUSH" if check_flush(raw_seven)
	end

	def check_flush(raw_seven)
		club_flush = 32
		diamond_flush = 243
		heart_flush = 3125
		spade_flush = 16807
		both_hole_cards = raw_seven[0..4]
		suite_value = both_hole_cards[0][1]*both_hole_cards[1][1]*both_hole_cards[2][1]*both_hole_cards[3][1]*both_hole_cards[4][1]
		puts suite_value
		flush = true if suite_value == club_flush || suite_value == diamond_flush || suite_value == heart_flush || suite_value == spade_flush
		if flush == true
			return true
		end
	end
	
end
