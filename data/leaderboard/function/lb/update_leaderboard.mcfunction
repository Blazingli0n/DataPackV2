##
 # update_leaderboard.mcfunction
 # 
 #
 # Created by DJT3.
##
$data modify storage leaderboard:line score set value $(score)
$scoreboard players set #int.temp_max_mp leaderboard $(max_players)

data modify storage leaderboard:line billboard set from entity @s billboard
execute if entity @s[nbt={brightness:{block:15}}] run data modify storage leaderboard:line bright set value 15
execute unless entity @s[nbt={brightness:{block:15}}] run data modify storage leaderboard:line bright set value {}
data modify storage leaderboard:line see_through set from entity @s see_through

function leaderboard:lb/sort_names with storage leaderboard:update

scoreboard players set #int.temp_lines leaderboard 0
scoreboard players set #int.temp_rank leaderboard 1

execute store result storage leaderboard:line rank int 1 run scoreboard players get #int.temp_rank leaderboard
execute store result storage leaderboard:line lines int 1 run scoreboard players get #int.temp_lines leaderboard
execute store result storage leaderboard:line sep double 0.30 run scoreboard players get #int.temp_rank leaderboard

execute store result score #int.namelist_size leaderboard run data get storage leaderboard:temp_namelist names_ordered
execute unless score #int.temp_rank leaderboard > #int.namelist_size leaderboard run function leaderboard:lb/add_line_prep with storage leaderboard:line

$execute unless score #int.temp_lines leaderboard matches $(max_players) run function leaderboard:lb/detect_remove_one_line with storage leaderboard:line
execute if score #int.line_killed leaderboard matches 1 as @s run function leaderboard:lb/remove_extra_line with storage leaderboard:line
execute if data storage leaderboard:leaderboard_nbt {data:{always_show_closest_player:1}} as @s at @s if entity @p[distance=..10] run function leaderboard:lb/get_player_rank_init with storage leaderboard:update

$scoreboard players set #int.temp_max_mp leaderboard $(max_players)
execute if data storage leaderboard:leaderboard_nbt {data:{always_show_closest_player:1}} as @s at @s if score #int.temp_rank leaderboard > #int.temp_max_mp leaderboard if entity @p[distance=..10] run function leaderboard:lb/add_close_player_line with storage leaderboard:line
execute if data storage leaderboard:leaderboard_nbt {data:{always_show_closest_player:1}} as @s at @s unless entity @p[distance=..10] run function leaderboard:lb/remove_closest_line
execute if data storage leaderboard:leaderboard_nbt {data:{always_show_closest_player:1}} as @s at @s unless score #int.temp_rank leaderboard > #int.temp_max_mp leaderboard run function leaderboard:lb/remove_closest_line