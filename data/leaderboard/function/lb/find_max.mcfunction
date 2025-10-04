##
 # find_max.mcfunction
 # 
 #
 # Created by DJT3.
##
data modify storage leaderboard:temp_player player set from storage leaderboard:temp_namelist names[-1]
data remove storage leaderboard:temp_namelist names[-1]
scoreboard players operation #int.temp_max_mp leaderboard = #int.temp_score_display leaderboard
function leaderboard:lb/max_score with storage leaderboard:temp_player
execute store result score #int.namelist_size leaderboard run data get storage leaderboard:temp_namelist names
execute unless score #int.temp_max_mp leaderboard = #int.temp_score_display leaderboard run execute store result storage leaderboard:temp_namelist max_id int 1.0 run scoreboard players get #int.namelist_size leaderboard
execute unless score #int.namelist_size leaderboard matches 0 run function leaderboard:lb/find_max