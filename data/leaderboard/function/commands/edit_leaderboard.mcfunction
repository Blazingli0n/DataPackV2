##
 # edit_leaderboard.mcfunction
 # 
 #
 # Created by DJT3.
##

data modify storage leaderboard:update score set from entity @n[type=text_display,tag=top,tag=leaderboard] data.score
execute at @n[type=text_display,tag=top,tag=leaderboard] run kill @e[type=text_display,tag=leaderboard,distance=..0.001,tag=!top]
$data merge entity @n[type=text_display,tag=top,tag=leaderboard] {data:{max_players:$(max_players),score:$(score),reverse_order:$(reverse_order),time_mode:$(time_mode),no_zero:$(no_zero),medal_color:$(medal_color),always_show_closest_player:$(always_show_closest_player),list:"$(list)",show_heads:$(show_heads)},text:"$(display_name)",billboard:$(billboard),see_through:$(see_through),brightness:{block:$(bright),sky:$(bright)}}

function leaderboard:lb/set_rotation

schedule function leaderboard:lb/update_all_init 1t replace