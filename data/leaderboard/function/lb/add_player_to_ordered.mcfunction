##
 # add_player_to_ordered.mcfunction
 # 
 #
 # Created by DJT3.
##
$execute if data storage leaderboard:leaderboard_nbt {data:{no_zero:0}} run data modify storage leaderboard:temp_namelist names_ordered append from storage leaderboard:temp_namelist names_unordered[$(max_id)]
$execute if data storage leaderboard:leaderboard_nbt {data:{no_zero:1}} unless score #int.temp_score_display leaderboard matches 0 run data modify storage leaderboard:temp_namelist names_ordered append from storage leaderboard:temp_namelist names_unordered[$(max_id)]
$data remove storage leaderboard:temp_namelist names_unordered[$(max_id)]