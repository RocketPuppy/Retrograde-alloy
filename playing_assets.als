module playing_assets

open static
open hand
open assets_area
open asset

fun play_asset[p: Player]: Asset -> Asset{
p.hand.top -> p.assets.top
}

pred can_play_asset (c, c': Asset, p: Player) {
play_asset[p][c] = c'
c != c'
}
run can_play_asset for 4
