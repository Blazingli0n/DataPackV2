##
 # get_score_values.mcfunction
 # 
 #
 # Created by DJT3.
##
$scoreboard players operation #int.value leaderboard = $(close_player) $(score)
$scoreboard players operation #int.temp_max_m leaderboard = $(player) $(score)