##
 # reset.mcfunction
 # lb
 #
 # Created by DJT3.
##
scoreboard objectives add leaderboard dummy
scoreboard objectives add money dummy "Money"

scoreboard players set #const.-1 leaderboard -1
scoreboard players set #const.1 leaderboard 1
scoreboard players set #const.2 leaderboard 2
scoreboard players set #const.3 leaderboard 3
scoreboard players set #const.5 leaderboard 5
scoreboard players set #const.10 leaderboard 10
scoreboard players set #const.20 leaderboard 20
scoreboard players set #const.60 leaderboard 60
scoreboard players set #const.100 leaderboard 100
scoreboard players set #bool.value_is_negative leaderboard 0
scoreboard players set #bool.money_has_score leaderboard 0
scoreboard players set #int.money_value leaderboard 0
scoreboard players set #int.money_whole leaderboard 0
scoreboard players set #int.money_cents leaderboard 0

# init time_mode storage
data modify storage leaderboard:line value_0 set value 0
data modify storage leaderboard:line value_1 set value 0
data modify storage leaderboard:line value_2 set value 0
data modify storage leaderboard:line value_3 set value 0
data modify storage leaderboard:line money_whole set value 0
data modify storage leaderboard:line money_cents set value 0

data modify storage leaderboard:namelist names set value []
tag @a remove lb_tracked

kill @e[type=minecraft:text_display,tag=leaderboard,tag=!top]
kill 00000070-0000-006e-0000-007400000078

function leaderboard:commands/rebuild_money_list
tellraw @a ["",{"text":"Leaderboards ","color":"gold"},{"text":"datapack "},{"text":"loaded","color":"green"}]
