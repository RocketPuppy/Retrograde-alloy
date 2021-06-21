module drawing_cards

open static
open deck
open hand

// Drawing a card from the deck takes it from the top of the deck and puts it in the bottom of the hand.
// This is specified using the "before and after" pattern, where we visualize two card instances
// as representing the same card before and after some period of time.
// The predicate says we can find an example in the model where this holds.
pred draw_card (c, c': Card, p: Player) {
c != c'
p.deck.top = c
p.hand.top = c'
}
run draw_card for 4
