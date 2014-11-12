local gfx = require "emulator.gfx"
local rcu = require "emulator.events"
local surface = require "emulator.surface"
local XMLToTable = require "src.XMLToTable"
local news_tables = require "src.news_tables"

text_converter = {}
---------------- initialize 26 letters --------------------------

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
local dot = gfx.loadpng("data/img/TNR/dot.png")
local comma = gfx.loadpng("data/img/TNR/comma.png")
local blank = gfx.loadpng("data/img/TNR/blank.png")

--------- create table for mapping ASCII code to the character_img  ----------
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



------------------------------------------------------------------
----------------------- initialize -------------------------------
local headline_surface = gfx.new_surface(240,66)

allnews = {}
--allnews = XMLToTable.readXML("data/rss/temp3.xml", "sport")
allnews = news_tables.getAllNews()

local headline_positions = {
  {xpos= 110, ypos = 70},
  {xpos= 511, ypos = 70},
  {xpos= 911, ypos = 70},
  {xpos= 110, ypos = 286},
  {xpos= 511, ypos = 286},
  {xpos= 911, ypos = 286}, 
  {xpos= 110, ypos = 502},
  {xpos= 511, ypos = 502},
  {xpos= 911, ypos = 502}
  }

local screen_des_rec = {
  x = 240, 
  y = 214, 
  w = screen:get_width(),
  h = screen:get_height()
}

local headline_src_rec = {
  x = 0, 
  y = 0, 
  w = headline_surface:get_width(),
  h = headline_surface:get_height()
}

local text_xi = 0
local text_yi = 0
local line_len = 0
------------------------------------------------------------------

---
--  Compare the character in letters.
--
function compare()
	-- body
	file = assert(io.open(filename, "r"))
	io.input(file)
	for chr in string.gmatch(io.read(),"%w") do
	end
end

---
--
--
--@param news
function parseRSSTable(news)
	local chr_img
	-- body
	 
	 --9 headlines are printed on the screen
   for i=1, 9 do
      -- a new headline surface are created for every headline. 
      headline_surface = gfx.new_surface(240,66)
      
	    for word in string.gmatch(news[i]["title"], "%w+") do
	    	-- for chr in string.gmatch(word, "%w") do
	    	-- 	print(chr .."-")
	    	-- 	-- create_surface(des_rec,get_chr_img(chr))
	    	-- 	get_chr_img(chr)
	    	-- end
	    	for i=1, string.len(word) do
	    		if line_len == 20 then
	    			line_len = 0
	    			text_xi = 0
	    			text_yi = text_yi + 29
	    		end
	    		chr = string.byte(word, i)
	    		get_chr_img(chr)
	    		line_len = line_len + 1
	    	end
	    	text_xi = text_xi + 10
	    	create_surface(blank,text_xi,text_yi)
	    end
	    
	  -- Change the position of the headline on the screen to the desired location for that specific headline 
    screen_des_rec['x']=headline_positions[i]['xpos']
    screen_des_rec['y']=headline_positions[i]['ypos']
    
    --the headline is added to the screen at the position specified above. 
    screen:copyfrom(headline_surface,headline_src_rec,screen_des_rec,true)
    
    --the text position and text line are set to 0 for the next headline surface. 
    text_xi = 0
    text_yi = 0
    line_len = 0
  end
   
end

---
-- Get character single image.
--
--@param chr
function get_chr_img(chr)
	-- body
	for i=1, #chr_table do
		if chr == chr_table[i].id then
			-- print(chr .."in func get_chr_img")
			if(chr <= 122 and chr >= 97)	then		
				create_surface(chr_table[i].img, text_xi, text_yi)
				text_xi = text_xi + 10
			elseif(chr <= 90 and chr >= 65) then
				create_surface(chr_table[i].img, text_xi, text_yi)
				text_xi = text_xi + 15
		    end
		end
	end
end

---
--Create surface for article
--
--@param img, x, y
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
    w = headline_surface:get_width(),
    h = headline_surface:get_height()
  }

  headline_surface:copyfrom(img, temp_src_rec, temp_des_rec, true)

end

---
-- The main function for text_converter.
--
function text_converter.main()
	-- body
	parseRSSTable(allnews)
--	screen:copyfrom(headline_surface,headline_src_rec,screen_des_rec,true)
	gfx.update()
end
 
--main()

return text_converter
