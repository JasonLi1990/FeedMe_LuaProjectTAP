local cron = require("emulator.cron")
local class = require( "emulator.classy" )

local timer = class("timer")

function timer:__init(interval_millisec, callback)
	self.interval = interval_millisec 
	self.callback = callback
	self.cron = cron.every(interval_millisec, callback)
	return self
end

function timer:stop()
	self.cron = nil
end

function timer:start()
	self.cron = cron.every(self.interval, self.callback)
end


function timer:update(dt)
	self.cron:update(dt)
end

return timer
