##
 # debug_money.mcfunction
 #
 # Quick inspection helper for money leaderboard values.
 #
 # Created by OpenAI ChatGPT.
##

tag @s add lb_money_debug_viewer

tellraw @s {"text":"[Money Leaderboard Debug]","color":"gold"}

tellraw @s {"text":"Scoreboard objective: \"money\" (stored as integer cents)","color":"yellow"}

scoreboard players set #int.money_debug_list leaderboard 0

execute if data storage leaderboard:namelist names run execute store result score #int.money_debug_list leaderboard run data get storage leaderboard:namelist names
execute unless data storage leaderboard:namelist names run tellraw @s {"text":"No default name list present (leaderboard:namelist names). Run /function leaderboard:commands/reset to rebuild it.","color":"red"}
execute if score #int.money_debug_list leaderboard matches 0 run tellraw @s {"text":"Default player list is currently empty. Players need to join so the datapack can track them.","color":"red"}

execute as @a run tellraw @a[tag=lb_money_debug_viewer,limit=1] {"text":"","extra":[{"text":" - ","color":"dark_gray"},{"selector":"@s","color":"white"},{"text":": ","color":"gray"},{"score":{"name":"@s","objective":"money"},"color":"aqua"},{"text":" (cents)","color":"dark_gray"}]}


tellraw @s {"text":"Values are listed in cents. Divide by 100 to display whole currency.","color":"gray"}

tag @s remove lb_money_debug_viewer
