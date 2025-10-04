##
 # update_all_init.mcfunction
 # 
 #
 # Created by DJT3.
##
execute as @a[tag=!lb_tracked] run function leaderboard:lb/add_name_to_storage
execute as @e[type=text_display,tag=leaderboard,tag=top] run function leaderboard:lb/update_all_leaderboard
schedule function leaderboard:lb/update_all_init 1s replace
