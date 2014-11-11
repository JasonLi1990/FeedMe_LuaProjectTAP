--
-- Luaunit testing
--
-- Author:    Adnan Pasic
--
-- Created:   24/10/2014
-- Copyright: TAP Interactive
--

-- app3 - luaunit tests

require('luaunit')



-----------------------------------------------------
--
-- test functions
--functions we use in our software with return value
-----------------------------------------------------
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


------------------------------------------------------------------
--
--                  Assertion Tests              
--
------------------------------------------------------------------

TestApp3Func = {} --class
    --in move() function if input value is "left"
    function TestApp3Func :test_move_left()
        a = "left"
      print('----------\n test with value = "left" \n-----------')
        result = move( a )
        --checks if it's a number
        assertEquals( type(result), 'number' )
        
        assertEquals( result, 4 )
        assertEquals( result, 3 )
        
    end
    
    --in move() function if input value is "right"
     function TestApp3Func :test_move_right()
        a = "right"
      print('----------\n test with value = "right" \n-----------')
        result = move( a )
        assertEquals( type(result), 'number' )
        assertEquals( result, 4 )
        assertEquals( result, 3 )
        
    end
    
    --in move() function if input value is "down"
    function TestApp3Func :test_move_down()
        a = "down"
      print('----------\n test with value = "down" \n-----------')
        result = move( a )
        assertEquals( type(result), 'number' )
        assertEquals( result, 4 )
        assertEquals( result, 2 )
    end
    
    --in move() function if input value is "up"
    function TestApp3Func :test_move_up()
        a = "up"
      print('----------\n test with value = "up" \n-----------')
        result = move( a )
        assertEquals( type(result), 'number' )
        assertEquals( result, 4 )
        assertEquals( result, 3 )
    end

--in highlight() function if input value is 1
    function TestApp3Func :test_highlight(a)
        a = 1
      print('----------\n test with value = 1 \n-----------')
        result = highlight( a )
        assertEquals( type(result), 'number' )
        assertEquals( result, 1 )
        assertEquals( result, 4 )
        
    end
    
    --in onKey() function if input values are "down" and "up"
    function TestApp3Func :test_onKey(a, b)
        a = "down"
        b = "up"
      print('----------\n test with key = "down" \n-----------')
        result = onKey( a, b )
        --if key == "down" it is okay, otherwise test is failed
        assertEquals( result, "down" )
        --assertEquals( result, "test" )
        
        --vill be failed--type is string
        assertEquals(type(result), 'number')
        
    end
    --in onKey() function if input values are "down" and "down"
    function TestApp3Func :test_onKey1(a, b)
        a = "down"
        b = "down"
      print('----------\n test with key = "down -- down" \n-----------')
        result = onKey( a, b )
        --if key == "down" it is okay, otherwise test is failed
        assertEquals( result, "down" )
        assertEquals( result, "test" )
        
    end
    
    
    TestLuaUnitAssertions = {}
    function TestLuaUnitAssertions:test_assertIsFunction()
        f = function() return true end

        assertError(assertIsFunction, 1)
        assertError(assertIsFunction, 1.4)
        assertError(assertIsFunction, "up and down, right and left!")
        assertError(assertIsFunction, nil)
        assertError(assertIsFunction, {})
        assertError(assertIsFunction, {1,2,3})
        assertError(assertIsFunction, {1})
        assertError(assertIsFunction, false)
        assertError(assertIsFunction, coroutine.create( function(v) local y=v+1 end ) )
        assertIsFunction(f)
    end
    

------------------------------------------------------------------
--
--                       Error message tests
--
------------------------------------------------------------------

TestLuaUnitErrorMsg = {} --class
    TestLuaUnitErrorMsg.__class__ = 'TestLuaUnitErrorMsg'

    function TestLuaUnitErrorMsg:tearDown()
        ORDER_ACTUAL_EXPECTED = true
    end

    function TestLuaUnitErrorMsg:test_assertEqualsMsg()
        assertErrorMsgEquals( 'expected: 2, actual: 1', assertEquals, 1, 2 )
        assertErrorMsgEquals( 'expected: "down"\nactual: "up"', assertEquals, 'up', 'down' )
        assertErrorMsgEquals( 'expected: true, actual: false', assertEquals, false, true )
        assertErrorMsgEquals( 'expected: 1.2, actual: 1', assertEquals, 1.0, 1.2)
        assertErrorMsgEquals( 'expected: {1, 2, 3}\nactual: {3, 2, 1}', assertEquals, {3,2,1}, {1,2,3} )
        assertErrorMsgEquals( 'expected: {one=1, two=2}\nactual: {3, 2, 1}', assertEquals, {3,2,1}, {one=1,two=2} )
        assertErrorMsgEquals( 'expected: 2, actual: nil', assertEquals, nil, 2 )
    end 


LuaUnit.verbosity = 2
os.exit( LuaUnit.run() )
