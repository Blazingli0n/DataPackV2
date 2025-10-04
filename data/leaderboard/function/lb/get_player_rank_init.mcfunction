##
 # get_player_rank_init.mcfunction
 # 
 #
 # Created by DJT3.
##
$data modify storage leaderboard:temp_namelist names set from storage $(list)
scoreboard players set #int.temp_rank leaderboard 0
execute at @s as @p run function leaderboard:lb/get_closest_player_name
function leaderboard:lb/get_player_rank
data modify storage leaderboard:line name set from storage leaderboard:temp_player close_player
