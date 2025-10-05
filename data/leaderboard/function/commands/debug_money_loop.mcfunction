##
 # debug_money_loop.mcfunction
 #
 # Walks the temporary debug name list and prints stored balances.
 #
 # Created by OpenAI ChatGPT.
##

scoreboard players set #int.money_debug_size leaderboard 0
execute if data storage leaderboard:debug names run execute store result score #int.money_debug_size leaderboard run data get storage leaderboard:debug names

execute if score #int.money_debug_size leaderboard matches 1.. run data modify storage leaderboard:debug player set from storage leaderboard:debug names[0]
execute if score #int.money_debug_size leaderboard matches 1.. run data remove storage leaderboard:debug names[0]
execute if score #int.money_debug_size leaderboard matches 1.. run function leaderboard:commands/debug_money_line with storage leaderboard:debug
execute if score #int.money_debug_size leaderboard matches 1.. run function leaderboard:commands/debug_money_loop
