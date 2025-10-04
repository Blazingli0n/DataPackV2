##
 # add_line_prep.mcfunction
 # 
 #
 # Created by DJT3.
##
$data modify storage leaderboard:line name set from storage leaderboard:temp_namelist names_ordered[$(lines)]

$execute at @s unless entity @e[type=text_display,distance=..0.001,tag=!top,tag=$(lines)] run function leaderboard:lb/add_line with storage leaderboard:line
function leaderboard:lb/update_line_init with storage leaderboard:line

scoreboard players operation #int.temp_lines leaderboard += #const.1 leaderboard
scoreboard players operation #int.temp_rank leaderboard = #int.temp_lines leaderboard
scoreboard players operation #int.temp_rank leaderboard += #const.1 leaderboard
execute store result storage leaderboard:line rank int 1 run scoreboard players get #int.temp_rank leaderboard
execute store result storage leaderboard:line lines int 1 run scoreboard players get #int.temp_lines leaderboard
execute store result storage leaderboard:line sep double 0.30 run scoreboard players get #int.temp_rank leaderboard

execute unless score #int.temp_rank leaderboard > #int.namelist_size leaderboard as @s run function leaderboard:lb/add_line_prep with storage leaderboard:line