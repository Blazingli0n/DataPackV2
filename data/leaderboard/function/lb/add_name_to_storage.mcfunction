##
 # add_name_to_storage.mcfunction
 # 
 #
 # Created by DJT3.
##
execute unless data storage leaderboard:namelist names run data modify storage leaderboard:namelist names set value []
execute at @s run summon item_display ~ ~ ~ {Tags:["name"],UUID:[I;112,110,116,120],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]}}
loot replace entity 00000070-0000-006e-0000-007400000078 container.0 loot leaderboard:entities/player_head

# Copy the player's name from the temporary head item into the shared list.
scoreboard players set #bool.temp_name_added leaderboard 0
execute store success score #bool.temp_name_added leaderboard run data modify storage leaderboard:namelist names append from entity 00000070-0000-006e-0000-007400000078 item.components."minecraft:profile".name

# Compatibility fallback for older component paths (pre-1.21 syntax).
execute if score #bool.temp_name_added leaderboard matches 0 run execute store success score #bool.temp_name_added leaderboard run data modify storage leaderboard:namelist names append from entity 00000070-0000-006e-0000-007400000078 item.components.minecraft:profile.name

# Warn the executor if we still couldn't capture their name so admins know to investigate.
execute if score #bool.temp_name_added leaderboard matches 0 run tellraw @s {"text":"[Leaderboards] Unable to capture your name for the default list. Please let an admin run /function leaderboard:commands/rebuild_money_list after you relog.","color":"red"}

scoreboard players add @s money 0
tag @s add lb_tracked
kill 00000070-0000-006e-0000-007400000078
