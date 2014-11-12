local gfx = require "lib/gfx"
local surface = require "lib/surface"
local TableFunctions = require "RSStoTable/TableFunctions"
local XMLToTable = require "RSStoTable/XMLToTable"

text_printer = {
}

--[[load and initialize 26 letters (uppercase and lowercase)]]
local upper_a = gfx.loadpng("img/TNR/uppercase_a.png")
local upper_b = gfx.loadpng("img/TNR/uppercase_b.png")
local upper_c = gfx.loadpng("img/TNR/uppercase_c.png")
local upper_d = gfx.loadpng("img/TNR/uppercase_d.png")
local upper_e = gfx.loadpng("img/TNR/uppercase_e.png")
local upper_f = gfx.loadpng("img/TNR/uppercase_f.png")
local upper_g = gfx.loadpng("img/TNR/uppercase_g.png")
local upper_h = gfx.loadpng("img/TNR/uppercase_h.png")
local upper_i = gfx.loadpng("img/TNR/uppercase_i.png")
local upper_j = gfx.loadpng("img/TNR/uppercase_j.png")
local upper_k = gfx.loadpng("img/TNR/uppercase_k.png")
local upper_l = gfx.loadpng("img/TNR/uppercase_l.png")
local upper_m = gfx.loadpng("img/TNR/uppercase_m.png")
local upper_n = gfx.loadpng("img/TNR/uppercase_n.png")
local upper_o = gfx.loadpng("img/TNR/uppercase_o.png")
local upper_p = gfx.loadpng("img/TNR/uppercase_p.png")
local upper_q = gfx.loadpng("img/TNR/uppercase_q.png")
local upper_r = gfx.loadpng("img/TNR/uppercase_r.png")
local upper_s = gfx.loadpng("img/TNR/uppercase_s.png")
local upper_t = gfx.loadpng("img/TNR/uppercase_t.png")
local upper_u = gfx.loadpng("img/TNR/uppercase_u.png")
local upper_v = gfx.loadpng("img/TNR/uppercase_v.png")
local upper_w = gfx.loadpng("img/TNR/uppercase_w.png")
local upper_x = gfx.loadpng("img/TNR/uppercase_x.png")
local upper_y = gfx.loadpng("img/TNR/uppercase_y.png")
local upper_z = gfx.loadpng("img/TNR/uppercase_z.png")

local a = gfx.loadpng("img/TNR/a.png")
local b = gfx.loadpng("img/TNR/b.png")
local c = gfx.loadpng("img/TNR/c.png")
local d = gfx.loadpng("img/TNR/d.png")
local e = gfx.loadpng("img/TNR/e.png")
local f = gfx.loadpng("img/TNR/f.png")
local g = gfx.loadpng("img/TNR/g.png")
local h = gfx.loadpng("img/TNR/h.png")
local i = gfx.loadpng("img/TNR/i.png")
local j = gfx.loadpng("img/TNR/j.png")
local k = gfx.loadpng("img/TNR/k.png")
local l = gfx.loadpng("img/TNR/l.png")
local m = gfx.loadpng("img/TNR/m.png")
local n = gfx.loadpng("img/TNR/n.png")
local o = gfx.loadpng("img/TNR/o.png")
local p = gfx.loadpng("img/TNR/p.png")
local q = gfx.loadpng("img/TNR/q.png")
local r = gfx.loadpng("img/TNR/r.png")
local s = gfx.loadpng("img/TNR/s.png")
local t = gfx.loadpng("img/TNR/t.png")
local u = gfx.loadpng("img/TNR/u.png")
local v = gfx.loadpng("img/TNR/v.png")
local w = gfx.loadpng("img/TNR/w.png")
local x = gfx.loadpng("img/TNR/x.png")
local y = gfx.loadpng("img/TNR/y.png")
local z = gfx.loadpng("img/TNR/z.png")
local dot = gfx.loadpng("img/TNR/dot.png")
local comma = gfx.loadpng("img/TNR/comma.png")
local blank = gfx.loadpng("img/TNR/blank.png")

--[[create the table for mapping ASCII code and character_img]]
local chr_table = {
  {id = 65,img = upper_a},
  {id = 66,img = upper_b},
  {id = 67,img = upper_c},
  {id = 68,img = upper_d},
  {id = 69,img = upper_e},
  {id = 70,img = upper_f},
  {id = 71,img = upper_g},
  {id = 72,img = upper_h},
  {id = 73,img = upper_i},
  {id = 74,img = upper_j},
  {id = 75,img = upper_k},
  {id = 76,img = upper_l},
  {id = 77,img = upper_m},
  {id = 78,img = upper_n},
  {id = 79,img = upper_o},
  {id = 80,img = upper_p},
  {id = 81,img = upper_q},
  {id = 82,img = upper_r},
  {id = 83,img = upper_s},
  {id = 84,img = upper_t},
  {id = 85,img = upper_u},
  {id = 86,img = upper_v},
  {id = 87,img = upper_w},
  {id = 88,img = upper_x},
  {id = 89,img = upper_y},
  {id = 80,img = upper_z},

  {id = 97,img = a},
  {id = 98,img = b},
  {id = 99,img = c},
  {id = 100,img = d},
  {id = 101,img = e},
  {id = 102,img = f},
  {id = 103,img = g},
  {id = 104,img = h},
  {id = 105,img = i},
  {id = 106,img = j},
  {id = 107,img = k},
  {id = 108,img = l},
  {id = 109,img = m},
  {id = 110,img = n},
  {id = 111,img = o},
  {id = 112,img = p},
  {id = 113,img = q},
  {id = 114,img = r},
  {id = 115,img = s},
  {id = 116,img = t},
  {id = 117,img = u},
  {id = 118,img = v},
  {id = 119,img = w},
  {id = 120,img = x},
  {id = 121,img = y},
  {id = 122,img = z},

}

allnews = {}
allnews = XMLToTable.getTable()

--[[initialize the headlines cordinator]]
local headline_positions = {
  {xpos= 240, ypos = 214},
  {xpos= 528, ypos = 214},
  {xpos= 820, ypos = 214},
  {xpos= 240, ypos = 422},
  {xpos= 528, ypos = 422},
  {xpos= 820, ypos = 422}, 
  {xpos= 240, ypos = 621},
  {xpos= 528, ypos = 621},
  {xpos= 820, ypos = 621}
  }

--[[unitialize the text cordinator and line]]
local text_xi = 0
local text_yi = 0
local line_len = 0

--[[Get character's single image]]--
function get_chr_img(chr,letter_width)
  -- body
  for i=1, TableFunctions.tablelength(chr_table) do
    if chr == chr_table[i].id then
      if(chr <= 122 and chr >= 97)  then
        create_surface(chr_table[i].img, text_xi, text_yi)
        text_xi = text_xi + letter_width
      elseif(chr <= 90 and chr >= 65) then
        create_surface(chr_table[i].img, text_xi, text_yi)
        text_xi = text_xi + letter_width
      end
    end
  end
end

--[[Patch up the character img on surface]]
function create_surface(img, x, y)
  -- body
  local xi = x
  local yi = y
  local temp_src_rec = {
    x = 0,
    y = 0,
    w = img:get_width(),
    h = img:get_height()
  }
  local temp_des_rec = {
    x = xi,
    y = yi,
    w = text_surface:get_width(),
    h = text_surface:get_height()
  }
  -- print(xi .." xi")
  text_surface:copyfrom(img, temp_src_rec, temp_des_rec, true)
  --gfx.update()
end

--[[reset the surface start cordinator x,y and line_len]]
function surface_reset()
  -- body
  line_len = 0
  text_xi = 0
  text_yi = 0
end

--[[A function that prints a string on a surface. The surface size is dependent on the length of
     the string as well as the restrictions of allowed maximum width and height. The parameters are:
     - string (The string to be printed) [String]
     - x (The x-position of the surface's upper left corner) [Integer]
     - y (The y-position of the surface's upper left corner) [Integer]
     - max_width (The maximum width the surface is allowed to occupy) [Integer]
     - max_height (The maximum height the surface is allowed to occupy, 
        if the text is too long it ends with "...") [Integer]
     - font (The name of the font as well as the size of it) [String] TO BE IMPLEMENTED
     - word_break (To determine if words shall be divided with "-" at the end of each line) [Boolean]
     - text_align (Sets the text alignment for the string) [String] ]]

function print_text(mixed_text, x, y, max_width, max_height, font, word_break, text_align)
  
  text = string.lower(mixed_text)
  local cal_height = 0
  fonts = {Li = {image_width = 10, image_height = 29}}

  -- initialize the letter width and height
  letter_width = fonts[font]["image_width"]
  letter_height = fonts[font]["image_height"]

  -- calculate and set the surface height
  if (max_height > (screen:get_height() - y)) then 
    surface_height = screen:get_height() - y
  else
    cal_height = (((string.len(text) * letter_width) / max_width) + 1) * letter_height
    if(max_height > cal_height) then
      surface_height = cal_height
    else
      surface_height = max_height
    end 
  end

  -- set the surface width 
  surface_width = max_width

  -- new surface for text by flexible surface width and height
  text_surface = gfx.new_surface(surface_width, surface_height)

  -- initialize color blue RGB
  local blue = {
    r=255,
    g=255,
    b=255,
    a=255 }

  -- set the text surface background blue
  text_surface:fill(blue)

  -- initialize the cordinator that the text surface on the screen
  local screen_des_rec = {
    x = x,
    y = y,
    w = screen:get_width(),
    h = screen:get_height()
  }

  -- initialize the cordinator that the crop of text surface
  local headline_src_rec = {
    x = 0,
    y = 0,
    w = surface_width,
    h = surface_height
  }

  -- 
  local not_spanned = true

  -- match the word in the string
  for word in string.gmatch(text, "%w+") do
    if(string.len(word) * letter_width > max_width) then
      not_spanned = false
      for i=1, string.len(word) do
        chr = string.byte(word, i)
        if(text_xi == max_width - letter_width) then
          create_surface(comma, text_xi, text_yi)
          text_xi = 0
          text_yi = text_yi + letter_height
          line_len = 0
          get_chr_img(chr,letter_width)
        else 
          get_chr_img(chr,letter_width)
        end
        line_len = line_len + letter_width

      end
    elseif((string.len(word) * letter_width) > (max_width - line_len)) then
      line_len = 0
      text_xi = 0
      text_yi = text_yi + letter_height
    end
    if(not_spanned) then
    for i=1, string.len(word) do
      chr = string.byte(word, i)
      get_chr_img(chr,letter_width)
      line_len = line_len + letter_width
    end
    end
    not_spanned = true
    text_xi = text_xi + letter_width
    line_len = line_len + letter_width
  end

  screen:copyfrom(text_surface,headline_src_rec,screen_des_rec,true)
  gfx.update()
end

function text_printer.main()
  for i=1, 9 do
    print_text(allnews[i]["title"], headline_positions[i]['xpos'], headline_positions[i]['ypos'], 250, 87, "Li", "dummy", "dummy")
    surface_reset()
  end
end

-- main()

return text_printer
