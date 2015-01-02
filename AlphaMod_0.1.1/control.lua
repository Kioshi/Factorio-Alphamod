-- redirect to scripts directory
require("scripts.utilities")     
require("scripts.EventHandler")
-- migrations
require("scripts.migrations.0_0_0_to_0_0_9")
require("scripts.migrations.0_0_9_to_0_0_10")
-- scripts
-- advanced fluid handling
require("scripts.pipes.pipes_fast_replace")
require("scripts.pipes.pipes_io_arrow_handler")
require("scripts.storage-tanks.storage-tank-replace")
require("scripts.storage-tanks.smart-storage-tank")
require("scripts.pumps.smart-pump")
require("scripts.liquid-disposal.liquid-disposal")    
require("scripts.boiler.electric-boiler")
require("scripts.liquid-splitter.liquid-splitter") 
--player
require("scripts.player.trash-bin")
require("scripts.player.drone")
