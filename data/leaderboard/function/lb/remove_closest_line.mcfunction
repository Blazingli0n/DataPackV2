##
 # remove_closest_line.mcfunction
 # 
 #
 # Created by DJT3.
##
scoreboard players operation #int.temp_lines leaderboard += #const.1 leaderboard
execute store result storage leaderboard:line lines int 1 run scoreboard players get #int.temp_lines leaderboard
scoreboard players operation #int.temp_lines leaderboard += #const.1 leaderboard
execute store result storage leaderboard:line sep double 0.3 run scoreboard players get #int.temp_lines leaderboard

function leaderboard:lb/remove_one_line with storage leaderboard:line