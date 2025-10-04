##
 # build_time_values.mcfunction
 # 
 #
 # Created by DJT3.
##
$execute store result score #int.value leaderboard run scoreboard players get $(name) $(score)

execute unless score #int.value leaderboard matches 0.. run scoreboard players set #bool.value_is_negative leaderboard 1
execute if score #int.value leaderboard matches 0.. run scoreboard players set #bool.value_is_negative leaderboard 0
execute unless score #int.value leaderboard matches 0.. run scoreboard players operation #int.value leaderboard *= #const.-1 leaderboard

scoreboard players operation #int.value_0 leaderboard = #int.value leaderboard
scoreboard players operation #int.value_0 leaderboard %= #const.20 leaderboard
scoreboard players operation #int.value_0 leaderboard *= #const.5 leaderboard
scoreboard players operation #int.value_1 leaderboard = #int.value leaderboard
scoreboard players operation #int.value_1 leaderboard /= #const.20 leaderboard
scoreboard players operation #int.value_2 leaderboard = #int.value_1 leaderboard 
scoreboard players operation #int.value_1 leaderboard %= #const.60 leaderboard
scoreboard players operation #int.value_2 leaderboard /= #const.60 leaderboard
scoreboard players operation #int.value_3 leaderboard = #int.value_2 leaderboard 
scoreboard players operation #int.value_2 leaderboard %= #const.60 leaderboard
scoreboard players operation #int.value_3 leaderboard /= #const.60 leaderboard

execute store result storage leaderboard:line value_0 int 1 run scoreboard players get #int.value_0 leaderboard 
execute store result storage leaderboard:line value_1 int 1 run scoreboard players get #int.value_1 leaderboard 
execute store result storage leaderboard:line value_2 int 1 run scoreboard players get #int.value_2 leaderboard 
execute store result storage leaderboard:line value_3 int 1 run scoreboard players get #int.value_3 leaderboard 