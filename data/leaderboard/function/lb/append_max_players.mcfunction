##
 # append_max_players.mcfunction
 # 
 #
 # Created by DJT3.
##

execute if data storage leaderboard:leaderboard_nbt {data:{reverse_order:1}} run scoreboard players set #int.temp_score_display leaderboard 2147483647
execute if data storage leaderboard:leaderboard_nbt {data:{reverse_order:0}} run scoreboard players set #int.temp_score_display leaderboard -2147483648

# Find max of all temp_score_display values

data modify storage leaderboard:temp_namelist names set from storage leaderboard:temp_namelist names_unordered
execute store result score #int.namelist_size leaderboard run data get storage leaderboard:temp_namelist names
data modify storage leaderboard:temp_namelist max_id set value 0
execute unless score #int.namelist_size leaderboard matches 0 run function leaderboard:lb/find_max

# Find player with index of max value and append it
function leaderboard:lb/add_player_to_ordered with storage leaderboard:temp_namelist

# Next loop ?

execute store result score #int.unorderred_namelist_size leaderboard run data get storage leaderboard:temp_namelist names_unordered
execute store result score #int.namelist_size leaderboard run data get storage leaderboard:temp_namelist names_ordered

$execute unless score #int.unorderred_namelist_size leaderboard matches 0 unless score #int.namelist_size leaderboard matches $(max_players) run function leaderboard:lb/append_max_players with storage leaderboard:update