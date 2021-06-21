module deck

open static

sig Deck extends Location {
	player: disj Player
}

fact {
one deck[Player1]
one deck[Player2]
}

fun deck(): Player -> Deck {
~(player)
}

assert each_player_has_a_different_deck {
one Player1.deck
one Player2.deck
Player1.deck != Player2.deck
}
check each_player_has_a_different_deck

pred each_player_has_a_different_deck {
one Player1.deck
one Player2.deck
Player1.deck != Player2.deck
}
run each_player_has_a_different_deck
