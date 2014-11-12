----------------------------------------------
-- Run this file to run unit tests on App 3
----------------------------------------------

------------ Require test framework ------------

 --
 -- Run this file to run unit tests on App 1
 --

-- The luaunit library
require('test.luaunit')

-- The usurpated love library
love = require('test.usurp_love')

-- The emulator functions
local surface = require "emulator/surface"
local gfx = require "emulator/gfx"
---local rcu = require "emulator/rcu"
--sys = require "emulator/sysmodule"
----- Require the code & tests to be tested ----

-- Main app
--require('app') 
--require('test.test_app') 

-- XMLToTable
require('src.XMLToTable')
require('test.test_XMLToTable')

-- text_converter
require('src.text_converter') --Error here since love isn't started when emulator gfx module is instantiated
require('test.test_text_converter')

--main_controller and main_view
require('src.main_controller')
require('test.test_app3-working-on-box')


-- Run the unit tests
os.exit( LuaUnit.run() )



--The code of the box to test
--require('functionnal_code')

-- Require the tests
--require('test.app2_test') 
