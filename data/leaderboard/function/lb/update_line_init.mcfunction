##
 # update_line_init.mcfunction
 # 
 #
 # Created by DJT3.
##
execute unless data storage leaderboard:leaderboard_nbt {data:{time_mode:0}} as @s run function leaderboard:lb/build_time_values with storage leaderboard:line
data modify storage leaderboard:line color set value "white"
$execute if data storage leaderboard:leaderboard_nbt {data:{medal_color:1}} if score #const.1 leaderboard matches $(rank) run data modify storage leaderboard:line color set value "#D6AF36"
$execute if data storage leaderboard:leaderboard_nbt {data:{medal_color:1}} if score #const.2 leaderboard matches $(rank) run data modify storage leaderboard:line color set value "#A7A7AD"
$execute if data storage leaderboard:leaderboard_nbt {data:{medal_color:1}} if score #const.3 leaderboard matches $(rank) run data modify storage leaderboard:line color set value "#A77044"

data modify storage leaderboard:line bold_name set value "false"
data modify storage leaderboard:line close_background set value 1
$execute at @s if data storage leaderboard:leaderboard_nbt {data:{always_show_closest_player:1}} if entity @p[distance=..10,name='$(name)'] run data modify storage leaderboard:line bold_name set value "true"
$execute at @s if data storage leaderboard:leaderboard_nbt {data:{always_show_closest_player:1}} if entity @p[distance=..10,name='$(name)'] run data modify storage leaderboard:line close_background set value 0

$execute store result storage leaderboard:line value int 1 run scoreboard players get $(name) $(score)
$execute at @s as @e[type=text_display,limit=1,tag=!top,tag=$(lines),distance=..0.001] run function leaderboard:lb/line_text_build with storage leaderboard:line