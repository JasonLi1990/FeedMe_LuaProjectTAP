graphics = {
  }

local back_src_rec = {
  x = 0, 
  y = 0, 
  w = background:get_width(),
  h = background:get_height()
}
local back_des_rec = {
  x = 0, 
  y = 0, 
  w = screen:get_width(),
  h = screen:get_height()
}

local des_rec = {
  x = 200, 
  y = 100, 
  w = screen:get_width(),
  h = screen:get_height()
}

function highlight(position)
  local x_cord
  local y_cord
  local img
  
  if position < 1 or position > 9 then
    return
  end
  
  if position == 1 or position == 4 or position == 7 then
    x_cord =260
  elseif position == 2 or position == 5 or position == 8 then
    x_cord =548
  elseif position == 3 or position == 6 or position == 9 then
    x_cord =840
  else
  end 

  if position == 1 or position == 2 or position == 3 then
    y_cord =60
    img = highlight_green
  elseif position == 4 or position == 5 or position == 6 then
    y_cord =268
    img = highlight_blue
  elseif position == 7 or position == 8 or position == 9 then
    y_cord =467
    img = highlight_pink
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
  screen:copyfrom(background,back_src_rec,back_des_rec,true)
  screen:copyfrom(img,src_rec,des_rec,true)
  --text_converter.main()
  gfx.update()


end

return graphics