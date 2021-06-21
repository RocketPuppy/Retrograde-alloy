module static

// This module defines the static aspects of the game.

// The game starts with two players.
abstract sig Player {}
one sig Player1, Player2 extends Player {
}

sig Index {}
one sig Top extends Index {}
// Each player plays cards, and a card is in a single location.
// For some locations the order of the cards in that location is important, so an index is kept.
abstract sig Location {
}
abstract sig Card {
,	location: disj (Player -> Index -> Location)
} {
one location
}

assert all_cards_have_a_single_location {
// All cards have one location over all players and indices.
all c: Card | one c.location[Player][Index]
// No card has no location over all players and indices.
no c: Card | no c.location[Player][Index]
}
check all_cards_have_a_single_location

assert no_card_is_in_the_same_location_as_another {
// There is no pair of cards, a player, and an index
no c, c': Card, p: Player, i: Index | {
	// where the cards are equal
	c = c'
	// and the location is the same
	c.location[p][i] != c'.location[p][i]
	}
}
check no_card_is_in_the_same_location_as_another

assert there_are_two_players {
#Player = 2
}
check there_are_two_players

fun cards(): Location -> Card {
{ l: Location, c: Card | some location[c][Player][Index] :> l }
}

pred cards_gives_all_cards(l: Location) {
Card in l.cards
}
run cards_gives_all_cards

assert cards_gives_cards {
all l: Location | l.cards in Card
}
check cards_gives_cards

pred some_locations_have_cards(l: Location) {
some l.cards
}
run some_locations_have_cards

pred some_locations_dont_have_cards(l: Location) {
no l.cards
}
run some_locations_dont_have_cards

fun card(): Location -> Index -> Card {
{ l: Location, i: Index, c: Card | some location[c][Player][i] :> l }
}

pred card_gives_all_cards(l: Location) {
Card in l.card[Index]
}
run card_gives_all_cards

assert card_gives_cards {
all l: Location | l.card[Index] in Card
}
check card_gives_cards

pred some_locations_have_a_card(l: Location, i: Index) {
l.card[i] in Card
}
run some_locations_have_a_card

pred some_locations_dont_have_a_card(l: Location, i: Index) {
no l.card[i]
}
run some_locations_dont_have_a_card

fun top(): Location -> Card {
{ l: Location, c: Card | some location[c][Player][Top] :> l }
}

pred top_gives_a_card(l: Location) {
l.top in Card
}
run top_gives_a_card
