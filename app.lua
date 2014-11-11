-- Main script for App 3

-- Includes
require("src.main_controller")

-- Main configuration and variables
controller = Main_controller:new()

local current_highlight

function onStart()
  -- nothing here yet
end

-- Forward rcu input to the controller
function onKey(key, state)
  controller:on_input(key, state)
end
