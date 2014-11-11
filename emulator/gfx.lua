
--[[
  


]]
local surface = require "emulator.surface"

gfx = {
}

function love.load()
  
end

--[[
  gfx.set_auto_update(bool)
  If set to true, any change to screen immediately triggers
  gfx.update() to make the change visible. This slows the system if
  the screen is updated in multiple steps but is useful for
  interactive development.
  //Not finished
]]
function gfx.set_auto_update(bool)

end

--[[
  Creates and returns a new 32-bit RGBA graphics surface of chosen
  dimensions. The surface pixels are not initialized; clear() or
  copyfrom() should be used for this.
  <width> and <height> must be positive integers and each less than 10000.
  An error is raised if enough graphics memory cannot be allocated.
]]
function gfx.new_surface(width, height)
  local image_data = surface()
  image_data:change_size(width, height)
  return image_data
end



--[[
  Returns the number of bytes of graphics memory the application
  currently uses. Each allocated pixel uses 4 bytes since all surfaces
  are 32-bit. A limit of gfx.get_memory_limit() is enforced.
]]
function gfx.get_memory_use()

end

--[[
  The surface that shows up on the screen when gfx.update() is called.
  Calling gfx.set_auto_update(true) makes the screen update
  automatically when screen is changed (for development; too slow
  for animations)
]]
screen = gfx.new_surface(love.window.getDesktopDimensions())

--[[
  Returns the maximum bytes of graphics memory the application is
  allowed to use.
]]
function gfx.get_memory_limit()

end

--[[
  Makes any pending changes to screen visible.
]]
function gfx.update()
  screen:draw()
end

--[[
  Loads the PNG image at <path> into a new surface that is
  returned. The image is always translated to 32-bit
  RGBA. Transparency is preserved. A call to surface:premultiply()
  might be necessary for transparency to work.
  An error is raised if not enough graphics memory can be allocated.
]]
function gfx.loadpng(path)
  local image_data = surface()
  image_data:img(path)
  return image_data
end

--[[
  Loads the JPEG image at <path> into a new surface that is returned.
  The image is always translated to 32-bit RGBA. All pixels will be
  opaque since JPEG does not support transparency.  
  An error is raised if not enough graphics memory can be allocated.
]]
function gfx.loadjpeg(path)
  local image_data = surface()
  image_data:img(path)
  return image_data
end

return gfx
