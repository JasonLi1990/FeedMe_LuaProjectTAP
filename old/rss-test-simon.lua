local SLAXML = require 'lib.slaxml' -- also requires slaxml.lua; be sure to copy both files
local xml = io.open('data/yahoo-latest.xml'):read('*all')

local onItem = false
local onDescription = false
local onTitle = false
local type

parser = SLAXML:parser{

    -- When "<foo" or <x:foo is seen
    startElement = function(name,nsURI,nsPrefix)
      if name == "item" then onItem = true end
      if onItem and name == "description" then
        onDescription = true
      end
      if onItem and name == "title" then
        onTitle = true
      end
    end,

    -- attribute found on current element
    attribute = function(name,value,nsURI,nsPrefix)

    end,

    -- text and CDATA nodes
    text = function(text)
      if onDescription or onTitle then
        text = text:gsub("<.->","")
        text = text:gsub("%.%.%.","")
        print(text)
        if onDescription then
          print()
        end
      end
    end,

    -- When "</foo>" or </x:foo> or "/>" is seen
    closeElement = function(name,nsURI)
      if name == "item" then onItem = false end
      if onItem and name == "description" then
        onDescription = false
      end
      if onItem and name == "title" then
        onTitle = false
      end
    end,

    -- comments
    comment      = function(content)
    end,

    -- processing instructions e.g. "<?yes mon?>"
    pi           = function(target,content)
    end,

}

parser:parse(xml,{stripWhitespace=true})
