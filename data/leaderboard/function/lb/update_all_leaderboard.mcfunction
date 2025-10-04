##
 # update_all_leaderboard.mcfunction
 # 
 #
 # Created by DJT3.
##
data modify storage leaderboard:leaderboard_nbt data set from entity @s data

data modify storage leaderboard:update score set from storage leaderboard:leaderboard_nbt data.score
data modify storage leaderboard:update max_players set from storage leaderboard:leaderboard_nbt data.max_players

execute store result score #bool.has_list leaderboard run data get storage leaderboard:leaderboard_nbt data.list
execute if score #bool.has_list leaderboard matches 0 run data modify storage leaderboard:update list set value "leaderboard:namelist names"
execute unless score #bool.has_list leaderboard matches 0 run data modify storage leaderboard:update list set from storage leaderboard:leaderboard_nbt data.list

function leaderboard:lb/update_leaderboard with storage leaderboard:update
