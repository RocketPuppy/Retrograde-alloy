module drawing_cards

open static
open deck
open hand

fun draw[p: Player]: Card -> Card{
p.deck.top -> p.hand.top
}
// Drawing a card from the deck takes it from the top of the deck and puts it in the bottom of the hand.
// This is specified using the "before and after" pattern, where we visualize two card instances
// as representing the same card before and after some period of time.
// The predicate says we can find an example in the model where this holds.
pred can_draw_card (c, c': Card, p: Player) {
draw[p][c] = c'
c != c'
}
run can_draw_card for 4
