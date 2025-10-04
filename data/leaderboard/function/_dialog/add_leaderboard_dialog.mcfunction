##
 # edit_leaderboard.mcfunction
 # 
 #
 # Created by DJT3.
##
data merge storage leaderboard:init_edit {dyn_score:"\u0024(score)",dyn_max_players:"\u0024(max_players)",dyn_display_name:"\u0024(display_name)",dyn_time_mode:"\u0024(time_mode)",dyn_reverse_order:"\u0024(reverse_order)",dyn_no_zero:"\u0024(no_zero)",dyn_billboard:"\u0024(billboard)",dyn_medal_color:"\u0024(medal_color)",dyn_always_show_closest_player:"\u0024(always_show_closest_player)",dyn_see_through:"\u0024(see_through)",dyn_bright:"\u0024(bright)",vertical_init:0,horizontal_init:0,fixed_init:0,center_init:0,time_mode_0_init:0,time_mode_1_init:0,time_mode_2_init:0,time_mode_3_init:0,dyn_list:"\u0024(list)",dyn_show_heads:"\u0024(show_heads)"}
data merge storage leaderboard:init_edit {score:score_name,display_name:"LeaderBoard Title",max_players:8,reverse_order:0,no_zero:0,medal_color:0,always_show_closest_player:1,billboard:"vertical",time_mode:0,see_through:0,bright:0,list:"",show_heads:0}

function leaderboard:lb/data_driven_dialog with storage leaderboard:init_edit