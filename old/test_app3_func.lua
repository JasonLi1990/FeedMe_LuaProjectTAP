--
-- Luaunit testing
--
-- Author:    Adnan Pasic
--
-- Created:   04/11/2014
-- Copyright: TAP Interactive
--

-- app3 - luaunit tests

--------------------------------------------------------------------------------------
--
--                  here are all functions we use in the program and testing here           
--
--------------------------------------------------------------------------------------


local current_highligt
local highlight

--if one button is pressed function counts the value..start att one (1)
function move(direction)
  current_highligt = 1
  if direction == "down" then
    if current_highligt < 7 then
      highlight = current_highligt+3 
    end
  end
  if direction == "up" then
    if current_highligt > 3 then
      highlight = current_highligt-3
    end
  end
  if direction == "right" then
    if current_highligt%3 ~= 0 then
      highlight = current_highligt+1
    end
  end
  if direction == "left" then
    if current_highligt ~= 1 and current_highligt ~= 4 and current_highligt ~= 7 then
      highlight = current_highligt-1
    end
  end
  return highlight
end

--function for position setting with x, y coordinats
function highlight(position)
  local x_cord
  local y_cord
  local img

  if position == 1 or position == 4 or position == 7 then
    x_cord =260
  elseif position == 2 or position == 5 or position == 8 then
    x_cord =548
  elseif position == 3 or position == 6 or position == 9 then
    x_cord =840
  else
    error()
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
    error()
  end 

  local src_rec = {
    x = 0, 
    y = 0, 
   -- w = img:get_width(),
    --h = img:get_height()
  }
  local des_rec = {
    x = x_cord, 
    y = y_cord, 
    --w = screen:get_width(),
   -- h = screen:get_height()
  }
  

  current_highligt = position
return position
end

function onKey(key, state)
  
  if state == 'down' then
    if key == "ok" then 
      -- io.write("a")
      screen:copyfrom(testpic,src_rec,des_rec,false)
      gfx.update()
      --screen = gfx.loadpng("img/PrototypeExpandedView2.png")
      --gfx.update()
    end
    if key == "down" or key == "up" or key == "right"  or key == "left"then 
      move(key)
    end
  end
  return key
end
local M = {}

allNews= {}
local news = {}
local filename ="temp3.xml"

function  getTable()
  return allNews
end

function checkSameRow(s)
  if(string.match(s,"%>(.-)%<")~=nil) then
    return true

  end 

  return false

end

function readXML()
  -- Opens a file in read
  file = io.open(filename, "r")
  -- sets the default input file as test.lua
  io.input(file)

  -- prints the first line of the 
  s=" "
  while (string.match(s,"%<(.-)%>")~="/rss") do
    s = file:read("*l")
    --1 news article
    if((string.match(s,"%<(.-)%>"))=="item") then 

      while (string.match(s,"%<(.-)%>")~="/item") do

        s = file:read("*l")

        --title
        if((string.match(s, "%<(.-)%>"))=="title" ) then

          if(checkSameRow(s)) then
            news["title"]=string.match(s, "%>(.-)%<")

          else 
            s = file:read("*l")
            news["title"]=s
          end
        end

        --description
        if((string.match(s, "%<(.-)%>"))=="description" ) then

          if(checkSameRow(s)) then

            news["description"]=string.match(s, "%>(.-)%<")
    
          else 
            s = file:read("*l")

            if(string.sub(s,1,1)~="<") then
              news["description"]=s
            else
              news["description"]=string.match(s,"%/a>(.-)%</p")

            end
          end
        
        end

        --link to article
        if((string.match(s, "%<(.-)%>"))=="link" ) then 
          if(checkSameRow(s)) then  
            news["articleLink"]=string.match(s,"%>(.-)%<")
          else
            s = file:read("*l")
            news["articleLink"]=s
          end
        end

        --pubDate
        if((string.match(s, "%<(.-)%>"))=="pubDate" ) then
          if(checkSameRow(s)) then  
            news["pubDate"]=string.match(s, "%>(.-)%<")
          else
            s = file:read("*l")
            news["pubDate"]=s
          end

        end


      end
      table.insert(allNews, {title = news["title"], description = news["description"]})

    end

  end

  -- closes the open file
  io.close(file)
end

readXML()

M.readXML = readXML
M.getTable = getTable

-- for i=1, 10 do
--   print(allNews[i]["title"])
-- end

return M
