local XMLToTable = require "src.XMLToTable"

tables = {}

--creates table with news from world.xml
worldNews={}
worldNews = XMLToTable.readXML("data/rss/world.xml")
  
--creates table with news from sport.xml
sportNews={}
sportNews = XMLToTable.readXML("data/rss/sport.xml")
  
--creates table with news from economy.xml
economyNews={}
economyNews = XMLToTable.readXML("data/rss/economy.xml")

--creates table with news from technology.xml
techNews={}
techNews = XMLToTable.readXML("data/rss/technology.xml")

allNews = {}
  
---
--getter for worldNews
--@return worldNews
function getWorldNews()
  return worldNews
end

---
--getter for sportNews
--@return sportNews
function getSportNews()
  return sportNews
end

---
--getter for economyNews
--@return economyNews
function getEconomyNews()
  return economyNews
end

---
--getter for techNews
--@return techNews
function getTechNews()
  return techNews
end
---
--Creates a table with all news
--This function adds all the news from the different categories to the allNews table and sorts it based on pubDate.
function createAllNews()
  allNews = getWorldNews()
  allNews = appendTable(allNews,sportNews)
  allNews = appendTable(allNews,economyNews)
  allNews = appendTable(allNews,techNews)
  
  table.sort(allNews,isLatest)  
  
end

---
--getter for allNews
--@return allNews
function getAllNews()
  return allNews
end

---
--Adds a table to another table
--This function takes in two tables as parameters and adds the second table to the end of the first table. 
--@param t1 t1 first table and second table
--@return t1
function appendTable(t1,t2)
  for i =1, #t2 do
    t1[(#t1+1)]=t2[i]
  end
  return t1
end

---
--Compare the dates of the news.
--This function get the os.time-date for the pubDate of two news and decides which date is the latest.
--@param news1, news2 
--@return true if date1 is later than date2 else return false
function isLatest(news1,news2) 
date1 =getDate(news1["pubDate"])
date2 =getDate(news2["pubDate"])

  if (date1 > date2) then
    return true
  end
    return false
end

---
--Finds os.time format for the pubDate
--This function finds the year, month,day and time in the pubDate string and returns the date on os.time format.
--@param s string corresponding to the news pubDate
--@return date in os.time format.
function getDate(s)
  monthToNumber ={Jan =1,Feb =2, Mar=3,Apr=4,May=5,Jun=6,Jul=7,Aug=8,Sep=9,Oct=10,Nov=11,Dec=12}

  y= string.sub(s,13,16)
  m= monthToNumber[string.sub(s,9,11)]
  d= string.sub(s,6,7)
  h=string.sub(s,18,19)
  mi=string.sub(s,21,22)
  se=string.sub(s,24,25)

  return os.time{year=y,month=m,day=d,hour=h,min=mi,sec=se}

end

function main()
 
  createAllNews() -- Att: Need to do this before you do getAllNews
  news= {}
  news = getAllNews()
  print(#news)
  table.sort(news,isLatest)
  for i = 1, 40 do
    print(news[i]["pubDate"])
  end

end

main()


--table.getWorldNews = getWorldNews
--table.getSprotNews = getSprotNews
--table.getTechNews = getTechNews
--table.getEconomyNews = getEconomyNews
--table.createAllNews = createAllNews

return tables