--[[
## surface data types ##
An area (pixmap) in graphics memory. Format is 32-bit RGBA.

color
  A Lua table of the color and alpha components, in range 0-255.
  Valid forms are

  -- Specify R, G, B. Alpha is 255 (opaque):
  {0, 0, 0}

  -- Specify R, G, B, A:
  {0, 0, 0, 0}

  -- Specify components by short name. Omitted components default to
  -- 0. At least one component must be specified:
  {r=0, g=0, b=0, a=0} 

  -- Specify components by long name. Omitted components default to
  -- 0. At least one component must be specified.
  {red=0, green=0, blue=0, alpha=0}

rectangle
  A Lua table specifying x, y, width and height
  In some cases, width and height are optional.
  Negative width or height are not allowed.
  At the moment, negative x or y are not allowed either.
  Valid forms are:
  {x=0, y=0, w=0, h=0}
  {x=0, y=0, width=0, height=0}
]]
local class = require( "emulator.classy" )

local surface = class( "surface")

function surface:__init()
  self.image_data = nil
end

function surface:img(path)
  self.image_data = love.image.newImageData(path)
end

function surface:change_size(x, y)
  self.image_data = love.image.newImageData(x, y)
  return self
end

--[[
  Fills the surface with a solid color, using hardware acceleration.
  Surface transparency is replaced by the transparency value of
  <color>.
  Default color is {0, 0, 0, 0}, that is black and completely transparent.
  Default rectangle is the whole surface. Parts outside the rectangle
  are not affected.
]]


function surface:clear(color, rectangle)
  local c = {
    r = 0,
    g = 0, 
    b = 0,
    a = 0
  }
  if color ~= nil then 
    c.r = color.r or 0
    c.g = color.g or 0
    c.b = color.b or 0
    c.a = color.a or 0
  end
  local r = {
    x = 0,
    y = 0,
    width = self.image_data:getWidth(),
    height = self.image_data:getHeight()
  }
  if rectangle ~= nil then
    r.x = rectangle.x or 0
    r.y = rectangle.y or 0
    if r.x + rectangle.width <= r.width then
      r.width = rectangle.width 
    end
    if r.y + rectangle.height <= r.height then
      r.height = rectangle.height 
    end
  end
  local w = r.x + r.width - 1
  local h = r.y + r.height - 1
  for i=r.x, w do
    for j=r.y, h do
      self.image_data:setPixel(i,j,c.r, c.g, c.b, c.a)
    end
  end
end

--[[
  Blends the surface with a solid color, weighing alpha values
  (SRCOVER). Uses hardware acceleration.
  Default rectangle is the whole surface. Parts outside the rectangle
  are not affected.
]]
function surface:fill(color, rectangle) --(color, [rectangle])
  local c = {
    r = 0,
    g = 0, 
    b = 0,
    a = 0
  }
  if color ~= nil then 
    c.r = color.r or 0
    c.g = color.g or 0
    c.b = color.b or 0
    c.a = color.a or 0
  end
  local r = {
    x = 0,
    y = 0,
    width = self.image_data:getWidth(),
    height = self.image_data:getHeight()
  }
  if rectangle ~= nil then
    r.x = rectangle.x or 0
    r.y = rectangle.y or 0
    if r.x + rectangle.width <= r.width then
      r.width = rectangle.width 
    end
    if r.y + rectangle.height <= r.height then
      r.height = rectangle.height 
    end
  end
  local w = r.x + r.width - 1
  local h = r.y + r.height - 1
  for i=r.x, w do
    for j=r.y, h do
      self.image_data:setPixel(i,j,c.r, c.g, c.b, c.a)
    end
  end
end

--[[
  Copy pixels from one surface to another, using hardware
  acceleration. Parts or all of <src_surface> can be copied.

  Scaling is done if dest_rectangle is of different size than
  src_rectangle. Areas outside of source or destination surfaces are
  (will be) clipped.

  If <src_rectangle> is nil, the whole <src_surface> is used.

  If <dest_rectangle> is nil or omitted, x=0, y=0 are assumed and
  width and height are taken from <src_rectangle>. If <dest_rectangle>
  doesn't specify width or height, these values are also taken from
  <src_rectangle>.

  If <blend_option> is true, copying is blended using the alpha
  information in <src_surface>. If false, the alpha channel is
  replaced by the values in <src_surface>.
  Default is false.
  //Not finished and not tested
]]
function surface:get()
  return self.image_data
end

function surface:copyfrom(src_surface, src_rectangle, dest_rectangle, blend_option)
  local dest = {
  x = 0, 
  y = 0
  }
  if dest_rectangle ~= nil then
    dest.x = dest_rectangle.x or 0
    dest.y = dest_rectangle.y or 0
  end
  local src_rec = {
    x = 0, 
    y = 0, 
    w = self.image_data:getWidth(),
    h = self.image_data:getHeight()
  }
  if src_rectangle == nil then
    src_rec.x = 0
    src_rec.y = 0
    src_rec.w = self.image_data:getWidth()
    src_rec.h = self.image_data:getWidth()
  end
   self.image_data:paste( src_surface:get(), dest.x, dest.y, src_rec.x, src_rec.y, src_rec.w, src_rec.h)
end

function surface:draw()
	image = love.graphics.newImage(self.image_data)
	function love.draw()
		love.graphics.draw(image)
	end
end

--[[
  Returns the pixel width (X axis) of the surface
]]
function surface:get_width()
  return self.image_data:getWidth()
end

--[[
  Returns the pixel height (Y axis) of the surface
]]
function surface:get_height()
  return self.image_data:getHeight()
end

--[[
  Returns the color value at position <x>, <y>, starting with index (0, 0).
  Mostly for testing, not optimized for speed
]]
function surface:get_pixel(x, y)
  r, g, b, a = self.image_data:getPixel( x, y )
  return r, g, b, a
end

--[[
  Sets the pixel at position <x>, <y> to <color>.
  Mostly for testing, not optimized for speed
]]
function surface:set_pixel(x, y, color)
  self.image_data:setPixel(x, y, color.r, color.g, color.b, color.a)
end

--[[
  Changes the surface pixel components by multiplying the alpha
  channel into the color channels. This prepares some images for
  blending with transparency.
  //Not finished and not tested
]]
function surface:premultiply()

end

--[[
  Frees the graphics memory used by this surface. The same is
  eventually done automatically by Lua garbage collection for
  unreferenced surfaces but doing it by hand guarantees the memory is
  returned at once.
  The surface can not be used again after this operation.
]]
function surface:destroy() 
  self.image_data = nil
end

return surface
