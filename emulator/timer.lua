--- 
-- Emulator timer Module
-- The timer simulation on emulator based on the Zenterio API used for time control of system.
-- @emulator timer

Timer = {}
---
-- Constructor/Factory for the timer object. 
--@param interval_millisec [Li write a description here]
--@param callback [Li write a description here]
function Timer:new(interval_millisec, callback)
  object = {}
  setmetatable(object,self)
  self.__index = Surface;
	self.interval = interval_millisec 
	self.callback = callback
	return self
end

---
-- Stop the timer.
function Timer:stop()
	self.cron = nil
end

---
--Start the timer.
function Timer:start()
	self.cron = cron.every(self.interval, self.callback)
end

---
-- Update the timer.
function Timer:update(dt)
	self.cron:update(dt)
end

return Timer
