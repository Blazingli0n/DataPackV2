##
 # remove_extra_line.mcfunction
 # 
 #
 # Created by DJT3.
##
execute store result storage leaderboard:line lines int 1 run scoreboard players get #int.temp_rank leaderboard
scoreboard players operation #int.temp_rank leaderboard += #const.1 leaderboard
execute store result storage leaderboard:line rank int 1 run scoreboard players get #int.temp_rank leaderboard

function leaderboard:lb/detect_remove_one_line with storage leaderboard:line

execute if score #int.line_killed leaderboard matches 1 as @s run function leaderboard:lb/remove_extra_line with storage leaderboard:line