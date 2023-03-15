-- Load the shared to-do list code from the file
function loadSharedCodeFromFile()
    local file = io.open("sharedToDoListJoinCode.txt", "r")
    if file then
      local savedCode = file:read("*n")
      file:close()
      return savedCode
    end
    return nil
  end
  
  -- Verify the entered code against the saved code
  function verifyCode(enteredCode, savedCode)
    return enteredCode == savedCode
  end
  
  -- Prompt the user to enter the shared to-do list code and verify it
  function joinSharedToDoList()
    local savedCode = loadSharedCodeFromFile()
    if not savedCode then
      print("ERROR 404: File does not exist.")
      return
    end
  
    while true do
      print("Please enter the 6-digit code to join the shared to-do list:")
      local enteredCode = io.read("*n")
      if verifyCode(enteredCode, savedCode) then
        print("Access granted to Shared ToDo List. Welcome!")
        -- call function to open shared to-do list here
        break
      else
        print("Unable to join Shared ToDo List. ERROR: Invalid Code, 404")
      end
    end
  end
  
  -- Example usage:
  joinSharedToDoList()
  
