--[[
This is the RCU (Remote Control Unit) module, an eventhandler for keyboard inputs.
The keyboard inputs are translated to buttons for the Zenterio remote control. 

The rcu module also initiates the function onStart()

onStart() and onKey() needs to be defined in the files that uses the rcu module,
in order for the file to work properly.

If onStart() is undefined when executing a file that uses the rcu module, 
an error will occur. 

If onKey() is undefined when executing a file that uses the rcu module,
an error will occur when a key on the keyboard is pressed. 
]]--

function love.load()
  onStart()
end

love.keyboard.setKeyRepeat(true)

local keyboard_to_remote = { 
  n = "ok", 
  up = "up",
  down = "down", 
  left = "left", 
  right = "right", 
  r  = "red", 
  g = "green", 
  y = "yellow", 
  b = "blue" , 
  w = "white", 
  i = "info", 
  m = "menu", 
  capslock = "guide", 
  o = "opt", 
  h = "help",  
  lshift = "star", 
  ralt = "multi", 
  e = "exit", 
  p = "pause", 
  t = "toggle_tv_radio",  
  c = "record", 
  lalt = "play", 
  s = "stop", 
  f = "fast_forward", 
  tab  = "rewind", 
  l = "skip_forward", 
  u = "skip_reverse", 
  z = "jump_to_end", 
  a = "jump_to_beginning", 
  d = "toggle_pause_play", 
  v = "vod", 
  backspace = "backspace", 
  rshift = "hash", 
  y = "back", 
  x = "ttx", 
  q = "record_list", 
  k = "play_list", 
  m= "mute"
  }

function love.keypressed(key, isrepeat)
  value= keyboard_to_remote[key]
  if tonumber(key) then
    value = key
  end
  if value then
    if isrepeat then
      onKey(value, "repeat")
    else
      onKey(value, "down")
    end
  end
end

function love.keyreleased(key)
  if keyboard_to_remote[key] then
    onKey(keyboard_to_remote[key], "up")
  elseif tonumber(key) then
    onKey(key, "up")
  end
end