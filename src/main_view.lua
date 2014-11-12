-- Includes


-- Class begins
Main_view = {
  -- Attributes
  text_converter = require "src.text_converter", 
  current_highlight = 1
}

-- Constructor/Factory for the view object
function Main_view:new(object)
  object = object or {}
  setmetatable(object, self)
  self.__index = self
  return self
end

-- Load the graphics
function Main_view:load()
  self.background = gfx.loadpng("data/img/Newbackground.png")
  self.highlight_img = gfx.loadpng("data/img/highlighttemp.png")
  self.article_view = gfx.loadpng("data/img/readModeGrid.png")
 -- self.highlight_green = gfx.loadpng("data/img/highlighttemp.png")
 -- self.highlight_blue = gfx.loadpng("data/img/highlight_blue.png")
 -- self.highlight_pink = gfx.loadpng("data/img/highlight_pink.png")
  
  self:highlight(1)
end


function Main_view:highlight(position)
  local x_cord
  local y_cord
  local img

  if position < 1 or position > 9 then
    return
  end

  if position == 1 or position == 4 or position == 7 then
    x_cord =57
  elseif position == 2 or position == 5 or position == 8 then
    x_cord =458
  elseif position == 3 or position == 6 or position == 9 then
    x_cord =858
  else
  end

  if position == 1 or position == 2 or position == 3 then
    y_cord =54
    img = self.highlight_img
  elseif position == 4 or position == 5 or position == 6 then
    y_cord =270
    img = self.highlight_img
  elseif position == 7 or position == 8 or position == 9 then
    y_cord =486
    img = self.highlight_img
  else
  end

  local src_rec = {
    x = 0,
    y = 0,
    w = img:get_width(),
    h = img:get_height()
  }

  local des_rec = {
    x = x_cord,
    y = y_cord,
    w = screen:get_width(),
    h = screen:get_height()
  }

  local back_src_rec = {
    x = 0,
    y = 0,
    w = self.background:get_width(),
    h = self.background:get_height()
  }

  local back_des_rec = {
    x = 0,
    y = 0,
    w = screen:get_width(),
    h = screen:get_height()
  }

  local des_rec = {
    x = x_cord,
    y = y_cord,
    w = screen:get_width(),
    h = screen:get_height()
  }

  screen:copyfrom(self.background,back_src_rec,back_des_rec,true)
  screen:copyfrom(img,src_rec,des_rec,true)
  text_converter.main()
  gfx.update()
  
  --return -- only for testing
  return src_rec, des_rec, back_src_rec, back_des_rec
end

function Main_view:move(direction)
  if direction == "down" then
    if self.current_highlight < 7 then
      self:highlight(self.current_highlight+3)
      self.current_highlight = self.current_highlight+3
    end
  end
  if direction == "up" then
    if self.current_highlight > 3 then
      self:highlight(self.current_highlight-3)
      self.current_highlight = self.current_highlight-3
    end
  end
  if direction == "right" then
    if self.current_highlight%3 ~= 0 then
      self:highlight(self.current_highlight+1)
      self.current_highlight = self.current_highlight+1
    end
  end
  if direction == "left" then
    if self.current_highlight ~= 1 and self.current_highlight ~= 4 and self.current_highlight ~= 7 then
      self:highlight(self.current_highlight-1)
      self.current_highlight = self.current_highlight-1
    end
  end
end

function  Main_view:print_article() 
 -- self.current_highlight 
 
 screen:copyfrom(self.article_view,back_src_,back_des_,true)
 gfx.update()
 
end
