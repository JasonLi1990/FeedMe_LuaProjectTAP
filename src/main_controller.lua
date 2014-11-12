-- Main controller class
--

-- Includes
require("src.controller")
require("src.main_view")

Main_controller = {
  -- Attributes
  view = Main_view:new()

}

-- Constructor/Factory for the controller object with
-- inheritance from the base controller.
-- See controller.lua for description of object orientation
function Main_controller:new(object)
  -- Create object
  object = object or Controller:new(object)
  setmetatable(object, self)
  self.__index = self

  -- Load the main view graphics
  self.view:load()

  return self
end

-- The crontroller's main task is to manage incoming events
-- and user input. This is function manages rcu input 
function Main_controller:on_input(key, state)
  print("Received key: "..key.." with state: "..state)

  -- We're only interested pressed keys, not released ones
  if state == "up" then
    return
  end

  if key == "ok" then
    self.view:print_article()
  elseif key == "down" or key == "up" or key == "right"  or key == "left" then
    self.view:move(key)
  elseif tonumber(key) then
    self.view:highlight(tonumber(key))
  end

end
