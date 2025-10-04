##
 # add_leaderboard.mcfunction
 # 
 #
 # Created by DJT3.
##

$summon text_display ~ ~2.5 ~ {Tags:["top","leaderboard"],billboard:$(billboard),brightness:{block:$(bright),sky:$(bright)},see_through:$(see_through),transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.2f,0f],scale:[1.3f,1.3f,1.3f]},text:{"text":"$(display_name)"},data:{max_players:$(max_players),score:$(score),reverse_order:$(reverse_order),time_mode:$(time_mode),no_zero:$(no_zero),medal_color:$(medal_color),always_show_closest_player:$(always_show_closest_player),list:"$(list)",show_heads:$(show_heads)}}
function leaderboard:lb/set_rotation
schedule function leaderboard:lb/update_all_init 1t replace