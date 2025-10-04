##
 # detect_remove_one_line.mcfunction
 # 
 #
 # Created by DJT3.
##
$execute store success score #int.line_killed leaderboard at @s run kill @e[type=text_display,distance=..0.001,nbt={transformation:{translation:[0f,-$(sep)f,0f]},data:{score:$(score)}},tag=!top,tag=$(lines)]