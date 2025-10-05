##
 # add_name_to_storage.mcfunction
 # 
 #
 # Created by DJT3.
##
execute unless data storage leaderboard:namelist names run data modify storage leaderboard:namelist names set value []
execute at @s run summon item_display ~ ~ ~ {Tags:["name"],UUID:[I;112,110,116,120],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]}}
loot replace entity 00000070-0000-006e-0000-007400000078 container.0 loot leaderboard:entities/player_head
data modify storage leaderboard:namelist names append from entity 00000070-0000-006e-0000-007400000078 item.components.minecraft:profile.name
scoreboard players add @s money 0
tag @s add lb_tracked
kill 00000070-0000-006e-0000-007400000078
