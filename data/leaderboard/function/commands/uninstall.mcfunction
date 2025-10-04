##
 # uninstall.mcfunction
 # 
 #
 # Created by DJT3.
##
dialog show @s { "type": "minecraft:confirmation","body":{"type":"item","item":{"id":"minecraft:barrier"},"description":{"contents":{"text":"This will ","extra":[{"text":"remove","color":"red"}," the LeaderBoards Datapack and ",{"text":"all loaded","bold":true}," Leaderboards in your world"]}}}, "title": { "text": "Uninstall Leaderboards Datapack" }, "yes": { "label": "Confirm", "action": { "type": "run_command", "command": "function leaderboard:lb/run_uninstall"} }, "no": {"label": "Cancel"}}