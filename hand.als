module hand

open static

sig Hand extends Location {
	player: disj Player
}

fact {
one hand[Player1]
one hand[Player2]
}

fun hand(): Player -> Hand {
~(player)
}

assert each_player_has_a_different_hand {
one Player1.hand
one Player2.hand
Player1.hand != Player2.hand
}
check each_player_has_a_different_hand

pred each_player_has_a_different_hand {
one Player1.hand
one Player2.hand
Player1.hand != Player2.hand
}
run each_player_has_a_different_hand
