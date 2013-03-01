card = []
card[1] = [41, 2] # Ace of Clubs
card[2] = [2, 2]
card[3] = [3, 2]
card[4] = [5, 2]
card[5] = [7, 2]
card[6] = [11, 2]
card[7] = [13, 2]
card[8] = [17, 2]
card[9] = [19, 2]
card[10] = [23, 2]
card[11] = [29, 2]
card[12] = [31, 2]
card[13] = [37, 2]

card[14] = [41, 3] # Ace of diamonds
card[15] = [2, 3]
card[16] = [3, 3]
card[17] = [5, 3]
card[18] = [7, 3]
card[19] = [11, 3]
card[20] = [13, 3]
card[21] = [17, 3]
card[22] = [19, 3]
card[23] = [23, 3]
card[24] = [29, 3]
card[25] = [31, 3]
card[26] = [37, 3]

card[27] = [41, 5,] # Ace of hearts
card[28] = [2, 5,]
card[29] = [3, 5,]
card[30] = [5, 5,]
card[31] = [7, 5,]
card[32] = [11, 5,]
card[33] = [13, 5,]
card[34] = [17, 5,]
card[35] = [19, 5,]
card[36] = [23, 5,]
card[37] = [29, 5,]
card[38] = [31, 5,]
card[39] = [37, 5,]

card[40] = [41, 7,] # Ace of spades
card[41] = [2, 7,]
card[42] = [3, 7,]
card[43] = [5, 7,]
card[44] = [7, 7,]
card[45] = [11, 7,]
card[46] = [13, 7,]
card[47] = [17, 7,]
card[48] = [19, 7,]
card[49] = [23, 7,]
card[50] = [29, 7,]
card[51] = [31, 7,]
card[0] = [37, 7,]

@run = true

def simulate_player1(draw)
	hole1 = [draw[0], draw[1]]
	puts "Hole cards for player1 are #{hole1[0]} and #{hole1[1]}"
	puts "Suited" if hole1[1][1] == hole1[0][1]
	puts "Pocket Pair" if hole1[0][0] == hole1[1][0]
	return hole1
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
		@run = false
		return true
	end
end

while @run
	@draw = card.sample(52)
	simulate_player1(@draw)
	simulate_player2(@draw)
	eval_player_hand(simulate_player1(@draw), simulate_flop(@draw), simulate_turn_card(@draw), simulate_river_card(@draw))
end

