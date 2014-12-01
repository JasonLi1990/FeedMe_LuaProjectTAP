------------------------------------------------------------------
--
--  app3 unit tests
--
------------------------------------------------------------------

test_app3_box = {}
  function test_app3_box:setUp()
    -- Set up and prepare here
    a =2
  end
  
  function test_app3_box:test_demo()
    assertEquals(1,1)
  end
  
  function test_app3_box:tearDown()
    -- Clean up here
  end
  
  function test_app3_box:test_highlight()
    Main_view:load()
    local s_rec, d_rec, back_src_rec, back_des_rec = Main_view:highlight(1)
    --local s_rec = Main_view:highlight(2)
    assertEquals(d_rec.x, 57)
    assertEquals(d_rec.y, 54)
    --assertEquals(d_rec.w, self.highlight_pink.get_width()) 
    assertTrue(d_rec.w >0)
    --assertEquals(d_rec.h, self.highlight_pink:get_height())
    assertTrue(d_rec.h > 0)
    assertEquals(s_rec.x, 0)
    assertEquals(s_rec.y, 0)
    --assertEquals(s_rec.w, self.highlight_pink:get_width())
    assertTrue(s_rec.w > 0)
    assertTrue(s_rec.h > 0)
    
  end
  function test_app3_box:test_move()
    --test if current_highlight (on start) is equal to 1
    assertEquals(Main_view.current_highlight, 1)
    --moving down 
    Main_view:move("down")
    --if current_highlight < 7 then + 3
    assertEquals(Main_view.current_highlight, 4)
    --set current_highlight to be 7 and then move down
    Main_view.current_highlight = 7
    Main_view:move("down")
    --current_highlight stay unchanged
    assertEquals(Main_view.current_highlight, 7)
    Main_view:move("right")
    assertEquals(Main_view.current_highlight, 8)
    --if current_highlight = 3 or 6 or 9 then stays unchanged
    Main_view.current_highlight = 9
    Main_view:move("right")
    assertEquals(Main_view.current_highlight, 9)
    Main_view.current_highlight = 6
    Main_view:move("right")
    assertEquals(Main_view.current_highlight, 6)
    Main_view.current_highlight = 3
    Main_view:move("right")
    assertEquals(Main_view.current_highlight, 3)
    
    --if current_highlight = 1 or 4 or 7 then stays unchanged
    Main_view.current_highlight = 1
    Main_view:move("left")
    assertEquals(Main_view.current_highlight, 1)
    
    Main_view.current_highlight = 4
    Main_view:move("left")
    assertEquals(Main_view.current_highlight, 4)
    
    Main_view.current_highlight = 7
    Main_view:move("left")
    assertEquals(Main_view.current_highlight, 7)
    --if current_highlight is different than 1, 4 or 7 then current_highlight - 1
    --current_highlight = 2
    Main_view.current_highlight = 2
    Main_view:move("left")
    assertEquals(Main_view.current_highlight, 1)
    
    --current_highlight = 3
    Main_view.current_highlight = 3
    Main_view:move("left")
    assertEquals(Main_view.current_highlight, 2)
    
    --current_highlight = 5
    Main_view.current_highlight = 5
    Main_view:move("left")
    assertEquals(Main_view.current_highlight, 4)
    
    --current_highlight = 6
    Main_view.current_highlight = 6
    Main_view:move("left")
    assertEquals(Main_view.current_highlight, 5)
    
    --current_highlight = 8
    Main_view.current_highlight = 8
    Main_view:move("left")
    assertEquals(Main_view.current_highlight, 7)
    
    --current_highlight = 9
    Main_view.current_highlight = 9
    Main_view:move("left")
    assertEquals(Main_view.current_highlight, 8)
    
    --current_highlight starts with 8 from above
    Main_view:move("up")
    --if current_highlight > 3 then - 3
    assertEquals(Main_view.current_highlight, 5)
    Main_view:move("up")
    assertEquals(Main_view.current_highlight, 2)
    --current_highlight < 3 --stays unchanged
    Main_view:move("up")
    assertEquals(Main_view.current_highlight, 2)
    end
-- end of Test