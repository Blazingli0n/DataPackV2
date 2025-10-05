##
 # rebuild_money_list.mcfunction
 #
 # Refreshes the default leaderboard player list and ensures everyone
 # currently online is tracked with an initialized money score.
 #
 # Created by OpenAI ChatGPT.
##

# Make sure the default list exists and starts empty before we rebuild it
execute unless data storage leaderboard:namelist names run data modify storage leaderboard:namelist names set value []
data modify storage leaderboard:namelist names set value []

# Clear tracking so every online player is re-added in this rebuild pass
tag @a remove lb_tracked

# Append all online players to the list and seed their money scoreboard entry
execute as @a run function leaderboard:lb/add_name_to_storage

# Restart the periodic updater quickly so the refreshed list renders right away
schedule function leaderboard:lb/update_all_init 1t replace

