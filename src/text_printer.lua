local gfx = require "emulator.gfx"
local surface = require "emulator.surface"
local TableFunctions = require "src.TableFunctions"
local XMLToTable = require "src.XMLToTable"

text_printer = {
}

--[[load and initialize 26 letters (uppercase and lowercase)]]
local upper_a = gfx.loadpng("data/img/TNR/uppercase_a.png")
local upper_b = gfx.loadpng("data/img/TNR/uppercase_b.png")
local upper_c = gfx.loadpng("data/img/TNR/uppercase_c.png")
local upper_d = gfx.loadpng("data/img/TNR/uppercase_d.png")
local upper_e = gfx.loadpng("data/img/TNR/uppercase_e.png")
local upper_f = gfx.loadpng("data/img/TNR/uppercase_f.png")
local upper_g = gfx.loadpng("data/img/TNR/uppercase_g.png")
local upper_h = gfx.loadpng("data/img/TNR/uppercase_h.png")
local upper_i = gfx.loadpng("data/img/TNR/uppercase_i.png")
local upper_j = gfx.loadpng("data/img/TNR/uppercase_j.png")
local upper_k = gfx.loadpng("data/img/TNR/uppercase_k.png")
local upper_l = gfx.loadpng("data/img/TNR/uppercase_l.png")
local upper_m = gfx.loadpng("data/img/TNR/uppercase_m.png")
local upper_n = gfx.loadpng("data/img/TNR/uppercase_n.png")
local upper_o = gfx.loadpng("data/img/TNR/uppercase_o.png")
local upper_p = gfx.loadpng("data/img/TNR/uppercase_p.png")
local upper_q = gfx.loadpng("data/img/TNR/uppercase_q.png")
local upper_r = gfx.loadpng("data/img/TNR/uppercase_r.png")
local upper_s = gfx.loadpng("data/img/TNR/uppercase_s.png")
local upper_t = gfx.loadpng("data/img/TNR/uppercase_t.png")
local upper_u = gfx.loadpng("data/img/TNR/uppercase_u.png")
local upper_v = gfx.loadpng("data/img/TNR/uppercase_v.png")
local upper_w = gfx.loadpng("data/img/TNR/uppercase_w.png")
local upper_x = gfx.loadpng("data/img/TNR/uppercase_x.png")
local upper_y = gfx.loadpng("data/img/TNR/uppercase_y.png")
local upper_z = gfx.loadpng("data/img/TNR/uppercase_z.png")

local a = gfx.loadpng("data/img/TNR/a.png")
local b = gfx.loadpng("data/img/TNR/b.png")
local c = gfx.loadpng("data/img/TNR/c.png")
local d = gfx.loadpng("data/img/TNR/d.png")
local e = gfx.loadpng("data/img/TNR/e.png")
local f = gfx.loadpng("data/img/TNR/f.png")
local g = gfx.loadpng("data/img/TNR/g.png")
local h = gfx.loadpng("data/img/TNR/h.png")
local i = gfx.loadpng("data/img/TNR/i.png")
local j = gfx.loadpng("data/img/TNR/j.png")
local k = gfx.loadpng("data/img/TNR/k.png")
local l = gfx.loadpng("data/img/TNR/l.png")
local m = gfx.loadpng("data/img/TNR/m.png")
local n = gfx.loadpng("data/img/TNR/n.png")
local o = gfx.loadpng("data/img/TNR/o.png")
local p = gfx.loadpng("data/img/TNR/p.png")
local q = gfx.loadpng("data/img/TNR/q.png")
local r = gfx.loadpng("data/img/TNR/r.png")
local s = gfx.loadpng("data/img/TNR/s.png")
local t = gfx.loadpng("data/img/TNR/t.png")
local u = gfx.loadpng("data/img/TNR/u.png")
local v = gfx.loadpng("data/img/TNR/v.png")
local w = gfx.loadpng("data/img/TNR/w.png")
local x = gfx.loadpng("data/img/TNR/x.png")
local y = gfx.loadpng("data/img/TNR/y.png")
local z = gfx.loadpng("data/img/TNR/z.png")
-- local dot = gfx.loadpng("data/img/TNR/dot.png")
-- local comma = gfx.loadpng("data/img/TNR/comma.png")
--local blank = gfx.loadpng("data/img/TNR/blank.png")


local chr_0 = gfx.loadpng("data/img/TNR/0.png")
local chr_1 = gfx.loadpng("data/img/TNR/1.png")
local chr_2 = gfx.loadpng("data/img/TNR/2.png")
local chr_3 = gfx.loadpng("data/img/TNR/3.png")
local chr_4 = gfx.loadpng("data/img/TNR/4.png")
local chr_5 = gfx.loadpng("data/img/TNR/5.png")
local chr_6 = gfx.loadpng("data/img/TNR/6.png")
local chr_7 = gfx.loadpng("data/img/TNR/7.png")
local chr_8 = gfx.loadpng("data/img/TNR/8.png")
local chr_9 = gfx.loadpng("data/img/TNR/9.png")

local space = gfx.loadpng("data/img/TNR/32.png")
local exclamation_mark = gfx.loadpng("data/img/TNR/33.png")
local double_quotation_mark = gfx.loadpng("data/img/TNR/34.png")
local pound = gfx.loadpng("data/img/TNR/35.png")
local dolar = gfx.loadpng("data/img/TNR/36.png")
local percent = gfx.loadpng("data/img/TNR/37.png")
local ampersand = gfx.loadpng("data/img/TNR/38.png")
local single_quotation_mark = gfx.loadpng("data/img/TNR/39.png")
local round_bracket_left = gfx.loadpng("data/img/TNR/40.png")
local round_bracket_right = gfx.loadpng("data/img/TNR/41.png")
local asterisk = gfx.loadpng("data/img/TNR/42.png")
local plus = gfx.loadpng("data/img/TNR/43.png")
local comma = gfx.loadpng("data/img/TNR/44.png")
local minus = gfx.loadpng("data/img/TNR/45.png")
local dot = gfx.loadpng("data/img/TNR/46.png")
local slash = gfx.loadpng("data/img/TNR/47.png")

local colon = gfx.loadpng("data/img/TNR/58.png")
local semicolon = gfx.loadpng("data/img/TNR/59.png")
local less_than_sign = gfx.loadpng("data/img/TNR/60.png")
local equal = gfx.loadpng("data/img/TNR/61.png")
local more_than_sign = gfx.loadpng("data/img/TNR/62.png")
local question_mark = gfx.loadpng("data/img/TNR/63.png")
local at = gfx.loadpng("data/img/TNR/64.png")

local square_bracket_left = gfx.loadpng("data/img/TNR/91.png")
local back_slash = gfx.loadpng("data/img/TNR/92.png")
local square_bracket_right = gfx.loadpng("data/img/TNR/93.png")
local caret = gfx.loadpng("data/img/TNR/94.png")
local underscore = gfx.loadpng("data/img/TNR/95.png")
local backquote = gfx.loadpng("data/img/TNR/96.png")




--[[create the table for mapping ASCII code and character_img]]
local chr_table = {
  {id = 32,img = space},
  {id = 33,img = exclamation_mark},
  {id = 34,img = double_quotation_mark},
  {id = 35,img = pound},
  {id = 36,img = dolar},
  {id = 37,img = percent},
  {id = 38,img = ampersand},
  {id = 39,img = single_quotation_mark},
  {id = 40,img = round_bracket_left},
  {id = 41,img = round_bracket_right},
  {id = 42,img = asterisk},
  {id = 43,img = plus},
  {id = 44,img = comma},
  {id = 45,img = minus},
  {id = 46,img = dot},
  {id = 47,img = slash},

  {id = 48,img = chr_0},
  {id = 49,img = chr_1},
  {id = 50,img = chr_2},
  {id = 51,img = chr_3},
  {id = 52,img = chr_4},
  {id = 53,img = chr_5},
  {id = 54,img = chr_6},
  {id = 55,img = chr_7},
  {id = 56,img = chr_8},
  {id = 57,img = chr_9},

  {id = 58,img = colon},
  {id = 59,img = semicolon},
  {id = 60,img = less_than_sign},
  {id = 61,img = equal},
  {id = 62,img = more_than_sign},
  {id = 63,img = question_mark},
  {id = 64,img = at},

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
  {id = 90,img = upper_z},

  {id = 91,img = square_bracket_left},
  {id = 92,img = back_slash},
  {id = 93,img = square_bracket_right},
  {id = 94,img = caret},
  {id = 95,img = underscore},
  {id = 96,img = backquote},

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
allnews = XMLToTable.readXML("data/rss/temp3.xml")

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
      create_surface(chr_table[i].img, text_xi, text_yi)
      text_xi = text_xi + letter_width
      -- if(chr <= 122 and chr >= 97)  then
      --   create_surface(chr_table[i].img, text_xi, text_yi)
      --   text_xi = text_xi + letter_width
      -- elseif(chr <= 90 and chr >= 65) then
      --   create_surface(chr_table[i].img, text_xi, text_yi)
      --   text_xi = text_xi + letter_width
      -- end
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
  text_surface:copyfrom(img, temp_src_rec, temp_des_rec, false)
  --gfx.update()
end

--[[reset the surface start cordinator x,y and line_len]]
function surface_reset()
  -- body
  line_len = 0
  text_xi = 0
  text_yi = 0
end
--[[Reset the text_xi, text_yi, line_len to get a new line]]
-- <<TESTED AND WORKING ON THE BOX>>
function new_line()
  -- body
  line_len = 0
  text_xi = 0
  text_yi = text_yi + letter_height
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
  

  -- match the word in the string
  -- for word in string.gmatch(text, "%w+") do
  --   if(string.len(word) * letter_width > max_width) then
  --     not_spanned = false
  --     for i=1, string.len(word) do
  --       chr = string.byte(word, i)
  --       if(text_xi == max_width - letter_width) then
  --         create_surface(comma, text_xi, text_yi)
  --         text_xi = 0
  --         text_yi = text_yi + letter_height
  --         line_len = 0
  --         get_chr_img(chr,letter_width)
  --       else 
  --         get_chr_img(chr,letter_width)
  --       end
  --       line_len = line_len + letter_width

  --     end
  --   elseif((string.len(word) * letter_width) > (max_width - line_len)) then
  --     line_len = 0
  --     text_xi = 0
  --     text_yi = text_yi + letter_height
  --   end
  --   if(not_spanned) then
  --   for i=1, string.len(word) do
  --     chr = string.byte(word, i)
  --     get_chr_img(chr,letter_width)
  --     line_len = line_len + letter_width
  --   end
  --   end
  --   not_spanned = true
  --   text_xi = text_xi + letter_width
  --   line_len = line_len + letter_width
  -- end
  line_max_len = math.floor(max_width/letter_width) * letter_width
  print(line_max_len)
  for i=1, string.len(text) do
    chr = string.byte(text,i)
    print(chr)
    if (line_max_len == line_len) then
        new_line()
        get_chr_img(chr,letter_width)
        line_len = line_len + letter_width
    else 
      line_len = line_len + letter_width
      if(check_end_of_line(chr))  then 
        get_chr_img(45,letter_width)
        new_line()
        get_chr_img(chr,letter_width)
        line_len = line_len + letter_width
      else
        get_chr_img(chr,letter_width)
      end
    end  
  end  
  screen:copyfrom(text_surface,headline_src_rec,screen_des_rec,false)
  gfx.update()
end

function check_end_of_line(chr)
  -- body
  local spanned = false
  if((chr <= 122 and chr >= 97)  or (chr <= 90 and chr >= 65)) and line_len == line_max_len then
    spanned = true
    print(chr.."spanned")
  end
  return spanned
end

function text_printer.main()
  for i=1, 9 do
    print_text(allnews[i]["title"], headline_positions[i]['xpos'], headline_positions[i]['ypos'], 250, 87, "Li", "dummy", "dummy")
    surface_reset()
    print("new title")
    print(allnews[i]["title"])
  end
end

-- main()

return text_printer
