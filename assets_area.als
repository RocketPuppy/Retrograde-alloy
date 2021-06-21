module assets_area

open static

sig Assets extends Location {
	player: disj Player
}

fact {
one assets[Player1]
one assets[Player2]
}

fun assets(): Player -> Assets {
~(player)
}

assert each_player_has_a_different_assets_area {
one Player1.assets
one Player2.assets
Player1.assets != Player2.assets
}
check each_player_has_a_different_assets_area

pred each_player_has_a_different_assets_area {
one Player1.assets
one Player2.assets
Player1.assets != Player2.assets
}
run each_player_has_a_different_assets_area
