##
 # add_close_player_line.mcfunction
 # 
 #
 # Created by DJT3.
##
execute store result storage leaderboard:line rank int 1 run scoreboard players get #int.temp_rank leaderboard

scoreboard players operation #int.temp_lines leaderboard += #const.1 leaderboard
scoreboard players operation #int.temp_rank leaderboard = #int.temp_lines leaderboard
scoreboard players operation #int.temp_rank leaderboard += #const.1 leaderboard

execute store result storage leaderboard:line lines int 1 run scoreboard players get #int.temp_lines leaderboard
execute store result storage leaderboard:line sep double 0.30 run scoreboard players get #int.temp_rank leaderboard

function leaderboard:lb/add_line_target with storage leaderboard:line
function leaderboard:lb/update_line_init with storage leaderboard:line