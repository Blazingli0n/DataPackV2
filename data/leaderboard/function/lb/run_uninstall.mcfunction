##
 # run_uninstall.mcfunction
 # 
 #
 # Created by DJT3.
##
kill @e[type=text_display,tag=leaderboard]

scoreboard objectives remove leaderboard

data remove storage leaderboard:temp_namelist names
data remove storage leaderboard:temp_namelist max_id
data remove storage leaderboard:temp_namelist names_ordered
data remove storage leaderboard:temp_namelist names_unordered

data remove storage leaderboard:line score
data remove storage leaderboard:line rank
data remove storage leaderboard:line lines
data remove storage leaderboard:line sep
data remove storage leaderboard:line name
data remove storage leaderboard:line value
data remove storage leaderboard:line value_0
data remove storage leaderboard:line value_1
data remove storage leaderboard:line value_2
data remove storage leaderboard:line value_3
data remove storage leaderboard:line money_whole
data remove storage leaderboard:line money_cents
data remove storage leaderboard:line billboard
data remove storage leaderboard:line see_through
data remove storage leaderboard:line bright
data remove storage leaderboard:line color
data remove storage leaderboard:line bold_name
data remove storage leaderboard:line close_background


data remove storage leaderboard:init_edit reverse_order
data remove storage leaderboard:init_edit display_name
data remove storage leaderboard:init_edit billboard
data remove storage leaderboard:init_edit no_zero
data remove storage leaderboard:init_edit brightness
data remove storage leaderboard:init_edit time_mode
data remove storage leaderboard:init_edit max_players
data remove storage leaderboard:init_edit always_show_closest_player
data remove storage leaderboard:init_edit see_through
data remove storage leaderboard:init_edit score
data remove storage leaderboard:init_edit medal_color
data remove storage leaderboard:init_edit bright
data remove storage leaderboard:init_edit list
data remove storage leaderboard:init_edit show_heads

data remove storage leaderboard:init_edit dyn_billboard
data remove storage leaderboard:init_edit dyn_time_mode
data remove storage leaderboard:init_edit dyn_medal_color
data remove storage leaderboard:init_edit dyn_max_players
data remove storage leaderboard:init_edit dyn_no_zero
data remove storage leaderboard:init_edit dyn_reverse_order
data remove storage leaderboard:init_edit dyn_score
data remove storage leaderboard:init_edit dyn_see_through
data remove storage leaderboard:init_edit dyn_always_show_closest_player
data remove storage leaderboard:init_edit dyn_bright
data remove storage leaderboard:init_edit dyn_display_name
data remove storage leaderboard:init_edit dyn_list
data remove storage leaderboard:init_edit dyn_show_heads

data remove storage leaderboard:init_edit vertical_init
data remove storage leaderboard:init_edit fixed_init
data remove storage leaderboard:init_edit horizontal_init
data remove storage leaderboard:init_edit center_init

data remove storage leaderboard:init_edit time_mode_0_init
data remove storage leaderboard:init_edit time_mode_1_init
data remove storage leaderboard:init_edit time_mode_2_init
data remove storage leaderboard:init_edit time_mode_3_init

data remove storage leaderboard:temp_player close_player
data remove storage leaderboard:temp_player player
data remove storage leaderboard:temp_player score
data remove storage leaderboard:update score
data remove storage leaderboard:update max_players
data remove storage leaderboard:update list

data remove storage leaderboard:leaderboard_nbt data

data remove storage leaderboard:line_nbt text

datapack disable "file/LeaderBoards_1.21.9_v4.0"
datapack disable "file/LeaderBoards_1.21.9_v4.0.zip"
tellraw @s {"text":"Leaderboard Datapack Uninstalled successfully","color":"red"}
reload