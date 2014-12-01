-- Some intersting general information and a general script here:
-- http://lua-users.org/wiki/LuaXml

-- This script uses SLAXML https://github.com/Phrogz/SLAXML

local xmlParser = require('lib.slaxml')

local yahooXml = io.open('data/yahoo-latest.xml'):read('*all')

local  isItem = false
  
parser = xmlParser:parser{
  
  startElement = function(name,nsURI,nsPrefix) 
    if name == 'item' then
      isItem = true
    else
      isItem = false
    end
  end, -- When "<foo" or <x:foo is seen
  attribute    = function(name,value,nsURI,nsPrefix) 
    
  end, -- attribute found on current element
  closeElement = function(name,nsURI)                
    
  end, -- When "</foo>" or </x:foo> or "/>" is seen
  text         = function(text)
    if isItem == true then
      print(text)
    end
  end, -- text and CDATA nodes
  comment      = function(content)                   
  
  end, -- comments
  pi           = function(target,content)            
  
  end, -- processing instructions e.g. "<?yes mon?>"
}

parser:parse(yahooXml,{stripWhitespace=true})
