##
 # get_closest_player_name.mcfunction
 # 
 #
 # Created by DJT3.
##
execute at @s run summon item_display ~ ~ ~ {Tags:["name"],UUID:[I;112,110,116,120],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]}}
loot replace entity 00000070-0000-006e-0000-007400000078 container.0 loot leaderboard:entities/player_head
data modify storage leaderboard:temp_player close_player set from entity 00000070-0000-006e-0000-007400000078 item.components.minecraft:profile.name
kill 00000070-0000-006e-0000-007400000078