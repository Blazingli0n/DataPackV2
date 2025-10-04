##
 # add_line_target.mcfunction
 # 
 #
 # Created by DJT3.
##
$execute at @s unless entity @e[type=text_display,distance=..0.001,tag=!top,tag=$(lines)] run function leaderboard:lb/add_line with storage leaderboard:line