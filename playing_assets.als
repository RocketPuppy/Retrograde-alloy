module playing_assets

open static
open hand
open assets_area
open asset

pred play_asset (c, c': Asset, p: Player) {
c != c'
p.hand.top = c
p.assets.top = c'
}
run play_asset for 4
