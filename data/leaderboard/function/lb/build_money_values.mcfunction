##
 # build_money_values.mcfunction
 #
 #
 # Created by DJT3.
##
scoreboard players set #bool.money_has_score leaderboard 0
scoreboard players set #bool.value_is_negative leaderboard 0
scoreboard players set #int.money_value leaderboard 0
scoreboard players set #int.money_cents leaderboard 0
scoreboard players set #int.money_whole leaderboard 0

# Keep the fake-name score holder in sync with the live entity score so
# selector-based updates (e.g. `scoreboard players add @s money 5`) still
# propagate to the string entry used by the leaderboard sort.
execute if entity @a[name='$(name)',limit=1] run scoreboard players add $(name) $(score) 0
execute if entity @a[name='$(name)',limit=1] run scoreboard players operation $(name) $(score) = @a[name='$(name)',limit=1] $(score)

data modify storage leaderboard:line money_whole set value 0
data modify storage leaderboard:line money_cents set value 0

execute store success score #bool.money_has_score leaderboard run scoreboard players get $(name) $(score)
execute unless score #bool.money_has_score leaderboard matches 1 run scoreboard players set $(name) $(score) 0
execute unless score #bool.money_has_score leaderboard matches 1 run execute store success score #bool.money_has_score leaderboard run scoreboard players get $(name) $(score)
execute if score #bool.money_has_score leaderboard matches 1 run execute store result score #int.money_value leaderboard run scoreboard players get $(name) $(score)

execute if score #bool.money_has_score leaderboard matches 1 unless score #int.money_value leaderboard matches 0.. run scoreboard players set #bool.value_is_negative leaderboard 1
execute if score #bool.money_has_score leaderboard matches 1 if score #int.money_value leaderboard matches 0.. run scoreboard players set #bool.value_is_negative leaderboard 0
execute if score #bool.money_has_score leaderboard matches 1 unless score #int.money_value leaderboard matches 0.. run scoreboard players operation #int.money_value leaderboard *= #const.-1 leaderboard

execute if score #bool.money_has_score leaderboard matches 1 run scoreboard players operation #int.money_cents leaderboard = #int.money_value leaderboard
execute if score #bool.money_has_score leaderboard matches 1 run scoreboard players operation #int.money_cents leaderboard %= #const.100 leaderboard

execute if score #bool.money_has_score leaderboard matches 1 run scoreboard players operation #int.money_whole leaderboard = #int.money_value leaderboard
execute if score #bool.money_has_score leaderboard matches 1 run scoreboard players operation #int.money_whole leaderboard /= #const.100 leaderboard

execute if score #bool.money_has_score leaderboard matches 1 run execute store result storage leaderboard:line money_whole int 1 run scoreboard players get #int.money_whole leaderboard
execute if score #bool.money_has_score leaderboard matches 1 run execute store result storage leaderboard:line money_cents int 1 run scoreboard players get #int.money_cents leaderboard

