##
 # debug_money_line.mcfunction
 #
 # Formats a single tracked money entry for the debug output.
 #
 # Created by OpenAI ChatGPT.
##

scoreboard players set #bool.money_debug_has_score leaderboard 0
scoreboard players set #bool.money_debug_negative leaderboard 0
scoreboard players set #int.money_debug_value leaderboard 0
scoreboard players set #int.money_debug_whole leaderboard 0
scoreboard players set #int.money_debug_cents leaderboard 0

execute store success score #bool.money_debug_has_score leaderboard run scoreboard players get $(player) money
execute if score #bool.money_debug_has_score leaderboard matches 0 run scoreboard players add $(player) money 0
execute store result score #int.money_debug_value leaderboard run scoreboard players get $(player) money

execute if score #int.money_debug_value leaderboard matches ..-1 run scoreboard players set #bool.money_debug_negative leaderboard 1
execute if score #bool.money_debug_negative leaderboard matches 1 run scoreboard players operation #int.money_debug_value leaderboard *= #const.-1 leaderboard

scoreboard players operation #int.money_debug_whole leaderboard = #int.money_debug_value leaderboard
scoreboard players operation #int.money_debug_whole leaderboard /= #const.100 leaderboard
scoreboard players operation #int.money_debug_cents leaderboard = #int.money_debug_value leaderboard
scoreboard players operation #int.money_debug_cents leaderboard %= #const.100 leaderboard

data modify storage leaderboard:debug text set value {"text":"","extra":[{"text":" - ","color":"dark_gray"},{"text":"$(player)","color":"white"},{"text":": ","color":"gray"},{"score":{"name":"$(player)","objective":"money"},"color":"aqua"},{"text":" cents (","color":"dark_gray"}]}
execute if score #bool.money_debug_negative leaderboard matches 1 run data modify storage leaderboard:debug text.extra append value {"text":"-","color":"red"}
data modify storage leaderboard:debug text.extra append value {"score":{"name":"#int.money_debug_whole","objective":"leaderboard"},"color":"aqua"}
data modify storage leaderboard:debug text.extra append value {"text":".","color":"aqua"}
execute if score #int.money_debug_cents leaderboard < #const.10 leaderboard run data modify storage leaderboard:debug text.extra append value {"text":"0","color":"aqua"}
data modify storage leaderboard:debug text.extra append value {"score":{"name":"#int.money_debug_cents","objective":"leaderboard"},"color":"aqua"}
data modify storage leaderboard:debug text.extra append value {"text":")","color":"dark_gray"}

tellraw @a[tag=lb_money_debug_viewer,limit=1] from storage leaderboard:debug text

execute if data storage leaderboard:debug text run data remove storage leaderboard:debug text
