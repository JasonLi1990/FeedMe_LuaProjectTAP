
-- Base controller class

Controller = {}

function Controller:new(object)
  object = object or {}      --makes it possible to create a copy
  setmetatable(object,self)  --add the Controller functions to the instance  
  self.__index = self;       --provides inheritance of keys to the instance
  return self
end

function Controller:on_input(key,state)
  
end

