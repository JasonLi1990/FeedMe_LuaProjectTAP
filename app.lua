-- Main script for App 3

-- Main configuration and variables
controller = nil

-- LuaEngine API function called when the script is started
-- in the environment
function onStart()
  print("onStart")
  load_controller("Main_controller")
end

-- LuaEngine API function called on input
-- Forward rcu input to the controller
function onKey(key, state)
  controller:on_input(key, state)
end

-- This function loads a new controller
function load_controller(controller_name)
  require("src." .. string.lower(controller_name))
  controller = _G[controller_name]:new()
end