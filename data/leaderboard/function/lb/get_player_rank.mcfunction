##
 # get_player_rank.mcfunction
 # 
 #
 # Created by DJT3.
##
data modify storage leaderboard:temp_player player set from storage leaderboard:temp_namelist names[-1]
data remove storage leaderboard:temp_namelist names[-1]

function leaderboard:lb/get_score_values with storage leaderboard:temp_player

execute if data storage leaderboard:leaderboard_nbt {data:{no_zero:0,reverse_order:0}} if score #int.temp_max_m leaderboard >= #int.value leaderboard run scoreboard players add #int.temp_rank leaderboard 1
execute if data storage leaderboard:leaderboard_nbt {data:{no_zero:0,reverse_order:1}} if score #int.temp_max_m leaderboard <= #int.value leaderboard run scoreboard players add #int.temp_rank leaderboard 1

execute if data storage leaderboard:leaderboard_nbt {data:{no_zero:1,reverse_order:0}} unless score #int.temp_max_m leaderboard matches 0 if score #int.temp_max_m leaderboard >= #int.value leaderboard run scoreboard players add #int.temp_rank leaderboard 1
execute if data storage leaderboard:leaderboard_nbt {data:{no_zero:1,reverse_order:1}} unless score #int.temp_max_m leaderboard matches 0 if score #int.temp_max_m leaderboard <= #int.value leaderboard run scoreboard players add #int.temp_rank leaderboard 1

execute store result score #int.namelist_size leaderboard run data get storage leaderboard:temp_namelist names
execute unless score #int.namelist_size leaderboard matches 0 run function leaderboard:lb/get_player_rank





