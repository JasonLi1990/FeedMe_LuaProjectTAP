local timer = require "emulator.timer"

local system = {}

-- Creates and starts a timer that calls <callback> every <interval_millisec>
-- If a string, the global variable will be fetched each time the timer triggers and that 
-- variable will be called, assuming it is a function. In this way callbacks can be replaced in real-time. 
function system.new_timer(interval_millisec, callback)
    t = timer(2, callback)

  --  The callback function is called with signature:
  --  callback(timer)
  --  where <timer> is the timer object that triggered the event
  function love.update(dt) --dt: The interval for the update function. 
    t:update(dt)
  end 
  return t
end

-- Returns the time since the system started, in seconds and fractions
-- of seconds. Useful to measure lengths of time.
function system.time()
  return os.clock()
end


-- Terminates the execution of the script. The rest of the currently
-- executing code will be run, but all timers are stopped and the
-- current script environment will never be called again.
function system.stop()
    return os.exit();
end

return system


