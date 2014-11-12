XMLToTable = {}

---
--Checks if the wanted text is on the same row as the tag.
--The function takes in a line and checks if there is text any between the sign '>' and '<'. If it isn't the conclusion is that the text is on the next line. 
--@param line - one line from the xml-file that includes some tag. 
--@return false if there is nothing between the tags else return true.

--OBS! Right now the "<item>" and "</item>" tag has to be on it's own row. Might want to fix this! 
function checkSameRow(line)
  if(string.match(line,"%>(.-)%<")~=nil) then
    return true
  end 
  return false
end

---
--Finds wanted tags in a xml file and saves it to allNews table.
--The function searches for the tags "title", "description", "link" and "pubDate" for every news in an xml file . The text between the tags are then added to a table (news) which are then added to a table containing all news called "allNews"
--@param filename, cat filename is a string corresponding to the name of an xml file, cat is the category of the file.
--@return allNews - table containing tables with information about every news, such as title, description etc. 
function readXML(filename, cat)
  local allNews= {}
  local news = {}
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

        --image
         if((string.match(s, "%<(.-)%:t"))=="media" ) then
             news["image"]=string.match(s, "%rl=\"(.-)%\"")
        end  

      end

      table.insert(allNews, {title = news["title"], description = news["description"], link = news["articleLink"], pubDate = news["pubDate"], image = news["image"], category=cat})
    end

  end
  -- closes the open file
  io.close(file)
  return allNews
end

XMLToTable.readXML = readXML
return XMLToTable
