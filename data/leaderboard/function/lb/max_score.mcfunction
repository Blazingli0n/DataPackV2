##
 # max_score.mcfunction
 # 
 #
 # Created by DJT3.
##

# Mirror the online player's actual score into their fake-name holder so the
# ordering logic works even when the objective is updated with selectors.
execute if entity @a[name='$(player)',limit=1] run scoreboard players add $(player) $(score) 0
execute if entity @a[name='$(player)',limit=1] run scoreboard players operation $(player) $(score) = @a[name='$(player)',limit=1] $(score)

$execute if data storage leaderboard:leaderboard_nbt {data:{reverse_order:1}} run scoreboard players operation #int.temp_score_display leaderboard < $(player) $(score)
$execute if data storage leaderboard:leaderboard_nbt {data:{reverse_order:0}} run scoreboard players operation #int.temp_score_display leaderboard > $(player) $(score)
