##
 # edit_leaderboard.mcfunction
 # 
 #
 # Created by DJT3.
##
data merge storage leaderboard:init_edit {dyn_score:"\u0024(score)",dyn_max_players:"\u0024(max_players)",dyn_display_name:"\u0024(display_name)",dyn_time_mode:"\u0024(time_mode)",dyn_reverse_order:"\u0024(reverse_order)",dyn_no_zero:"\u0024(no_zero)",dyn_billboard:"\u0024(billboard)",dyn_medal_color:"\u0024(medal_color)",dyn_always_show_closest_player:"\u0024(always_show_closest_player)",dyn_see_through:"\u0024(see_through)",dyn_bright:"\u0024(bright)",vertical_init:0,horizontal_init:0,fixed_init:0,center_init:0,time_mode_0_init:0,time_mode_1_init:0,time_mode_2_init:0,dyn_list:"\u0024(list)"}
execute as @n[type=text_display,tag=top] run function leaderboard:lb/get_leaderboard_settings

execute store result score #int.billboard_length leaderboard run data get storage leaderboard:init_edit billboard
execute store success storage leaderboard:init_edit vertical_init byte 1 if score #int.billboard_length leaderboard matches 8
execute store success storage leaderboard:init_edit horizontal_init byte 1 if score #int.billboard_length leaderboard matches 10
execute store success storage leaderboard:init_edit fixed_init byte 1 if score #int.billboard_length leaderboard matches 5
execute store success storage leaderboard:init_edit center_init byte 1 if score #int.billboard_length leaderboard matches 6

execute as @n[type=text_display,tag=top] store success storage leaderboard:init_edit time_mode_0_init byte 1 if entity @s[nbt={data:{time_mode:0}}]
execute as @n[type=text_display,tag=top] store success storage leaderboard:init_edit time_mode_1_init byte 1 if entity @s[nbt={data:{time_mode:1}}]
execute as @n[type=text_display,tag=top] store success storage leaderboard:init_edit time_mode_2_init byte 1 if entity @s[nbt={data:{time_mode:2}}]


function leaderboard:lb/data_driven_dialog_edit with storage leaderboard:init_edit