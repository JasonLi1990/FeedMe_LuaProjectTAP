test_app3 = {}
  function test_app3:setUp()
    -- Set up and prepare tests here
  end
  
  function test_app3:test_hello_world()
    assertEquals(hello_world(),"Hello World!")
  end
  
  function test_app3:tearDown()
    -- Clean up after tests here
  end
-- end of TestMain
