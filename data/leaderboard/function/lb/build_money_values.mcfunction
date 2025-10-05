##
 # build_money_values.mcfunction
 #
 #
 # Created by DJT3.
##
$execute store result score #int.money_value leaderboard run scoreboard players get $(name) $(score)

execute unless score #int.money_value leaderboard matches 0.. run scoreboard players set #bool.value_is_negative leaderboard 1
execute if score #int.money_value leaderboard matches 0.. run scoreboard players set #bool.value_is_negative leaderboard 0
execute unless score #int.money_value leaderboard matches 0.. run scoreboard players operation #int.money_value leaderboard *= #const.-1 leaderboard

scoreboard players operation #int.money_cents leaderboard = #int.money_value leaderboard
scoreboard players operation #int.money_cents leaderboard %= #const.100 leaderboard

scoreboard players operation #int.money_whole leaderboard = #int.money_value leaderboard
scoreboard players operation #int.money_whole leaderboard /= #const.100 leaderboard

execute store result storage leaderboard:line money_whole int 1 run scoreboard players get #int.money_whole leaderboard
execute store result storage leaderboard:line money_cents int 1 run scoreboard players get #int.money_cents leaderboard
