##
 # line_text_build.mcfunction
 # 
 #
 # Created by DJT3.
##

$data modify storage leaderboard:line_nbt text set value {"text":"","extra":[{"text":"#$(rank) ","color":"$(color)"}," ",{"text":"$(name)","bold":$(bold_name)},"  :  "]}

# Player head
$execute if data storage leaderboard:leaderboard_nbt {data:{show_heads:1}} run data modify storage leaderboard:line_nbt text.extra insert 1 value {"player":{"name":"$(name)"}} 

# Normal score
$execute if data storage leaderboard:leaderboard_nbt {data:{time_mode:0}} run data modify storage leaderboard:line_nbt text.extra append value {"text":"$(value)","color":"red"}

# Time
# Negative time
execute unless data storage leaderboard:leaderboard_nbt {data:{time_mode:0}} if score #bool.value_is_negative leaderboard matches 1 run data modify storage leaderboard:line_nbt text.extra append value {"text":"-","color":"red"}

# XH Xm Xs XXms
$execute if data storage leaderboard:leaderboard_nbt {data:{time_mode:2}} if score #int.value_3 leaderboard >= #const.1 leaderboard unless score #const.5 leaderboard >= #int.value_0 leaderboard run data modify storage leaderboard:line_nbt text.extra append value {"text":"$(value_3)h $(value_2)m $(value_1).$(value_0)s","color":"red"}
# XH Xm Xs 0Xms
$execute if data storage leaderboard:leaderboard_nbt {data:{time_mode:2}} if score #int.value_3 leaderboard >= #const.1 leaderboard if score #const.5 leaderboard >= #int.value_0 leaderboard run data modify storage leaderboard:line_nbt text.extra append value {"text":"$(value_3)h $(value_2)m $(value_1).0$(value_0)s","color":"red"}

# XH Xm
$execute if data storage leaderboard:leaderboard_nbt {data:{time_mode:1}} if score #int.value_3 leaderboard >= #const.1 leaderboard unless score #const.5 leaderboard >= #int.value_0 leaderboard run data modify storage leaderboard:line_nbt text.extra append value {"text":"$(value_3)h $(value_2)m $(value_1)s","color":"red"}
# XH Xm
$execute if data storage leaderboard:leaderboard_nbt {data:{time_mode:1}} if score #int.value_3 leaderboard >= #const.1 leaderboard if score #const.5 leaderboard >= #int.value_0 leaderboard run data modify storage leaderboard:line_nbt text.extra append value {"text":"$(value_3)h $(value_2)m $(value_1)s","color":"red"}

# Xm Xs XXms
$execute unless data storage leaderboard:leaderboard_nbt {data:{time_mode:0}} if score #int.value_2 leaderboard >= #const.1 leaderboard unless score #int.value_3 leaderboard >= #const.1 leaderboard unless score #const.5 leaderboard >= #int.value_0 leaderboard run data modify storage leaderboard:line_nbt text.extra append value {"text":"$(value_2)m $(value_1).$(value_0)s","color":"red"}
# Xm Xs 0Xms
$execute unless data storage leaderboard:leaderboard_nbt {data:{time_mode:0}} if score #int.value_2 leaderboard >= #const.1 leaderboard unless score #int.value_3 leaderboard >= #const.1 leaderboard if score #const.5 leaderboard >= #int.value_0 leaderboard run data modify storage leaderboard:line_nbt text.extra append value {"text":"$(value_2)m $(value_1).0$(value_0)s","color":"red"}

# Xs XXms
$execute unless data storage leaderboard:leaderboard_nbt {data:{time_mode:0}} unless score #int.value_2 leaderboard >= #const.1 leaderboard unless score #int.value_3 leaderboard >= #const.1 leaderboard unless score #const.5 leaderboard >= #int.value_0 leaderboard run data modify storage leaderboard:line_nbt text.extra append value {"text":"$(value_1).$(value_0)s","color":"red"}
# Xs 0Xms
$execute unless data storage leaderboard:leaderboard_nbt {data:{time_mode:0}} unless score #int.value_2 leaderboard >= #const.1 leaderboard unless score #int.value_3 leaderboard >= #const.1 leaderboard if score #const.5 leaderboard >= #int.value_0 leaderboard run data modify storage leaderboard:line_nbt text.extra append value {"text":"$(value_1).0$(value_0)s","color":"red"}

data modify entity @s text set from storage leaderboard:line_nbt text

$execute unless score #const.1 leaderboard matches $(close_background) run data modify entity @s background set value -1777069036
$data modify entity @s default_background set value $(close_background)