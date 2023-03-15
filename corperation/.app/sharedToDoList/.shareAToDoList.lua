function generateCode()
    math.randomseed(os.time()) 
    return math.random(100000, 999999) 
  end
  
  function verifyCode(enteredCode, savedCode)
    return enteredCode == savedCode
  end
  

  savedCode = generateCode()

local function emailInvite()
    
    io.write("Your name: ")
    local sendersName = io.read()

    repeat
        io.write("Recipiants Email: ")
        local recipiantsEmail = io.read()

        -- Check if the email matches the pattern
        if recipiantsEmail:match(".+@.+%.com$") or recipiantsEmail:match(".+@.+%.org$") 
        or recipiantsEmail:match(".+@.+%.edu$")
        or recipiantsEmail:match(".+@.+%.net$")
        or recipiantsEmail:match(".+@.+%.io$")
        or recipiantsEmail:match(".+@.+%.me$")
        or recipiantsEmail:match(".+@.+%.ca$")
        or recipiantsEmail:match(".+@.+%.tech$")
        or recipiantsEmail:match(".+@.+%.ai$")
        or recipiantsEmail:match(".+@.+%.studio$")
        or recipiantsEmail:match(".+@.+%.studio$")
        or recipiantsEmail:match(".+@.+%.gov$")
        or recipiantsEmail:match(".+@.+%.contact$")
        then
            -- Valid email address
            break
        else
            -- Invalid email address
            print("Invalid email address. Please enter a valid email address.")
        end
    until false

    print("") -- spacer
    print("Create email: ")
    print("") -- spacer

    io.write("Recipiants name: ")
    local recipiantsName = io.read()

    io.write("More recipiants (user , to seperate): ")
    local moreRecipiants = io.read()

    io.write("Email Subject: ")
    local emailSubject = io.read()

    io.write("Added content of the email (opintal if nothing space): ")
    local addedContent = io.read()

    -- create email

    print(recipiantsEmail, moreRecipiants)

    print("")
    
    print("Subject: " .. emailSubject)
    print("Hey, " .. recipiantsName .. " requested you to join a Shared ProTask To-Do List. If you would like to join please enter this code inside of corportation/.app/joinSharedToDoList.lua. Here is your shared code: " .. savedCode)
    print(addedContent)
    -- print("")
    print("Senserly,")
    print(sendersName)
    print("This message was automated by ProTask, a real user named " .. sendersName .. " wants you to join a Shared ToDo List.")


end
emailInvite()

local function writeSharedCodeToFile()

    local file = io.open("sharedToDoListJoinCode.txt", "w")

    file:write(savedCode .. "\n")

    file:close()
end
writeSharedCodeToFile()

local function app()


    io.write("hit enter to reveal the todo list section")
    io.flush()
    io.read("*line")
    

    io.write("Task Name: ")
    local taskName = io.read()

    io.write("Asignees: ")
    local assignees = io.read()

    io.write("Due Date: ")
    local dueDate = io.read()

    io.write("Other Notes: ")
    local otherNotes = io.read()

    -- write to file

    local file = io.open("sharedToDoList.txt", "a")

    file:write("\n")
    file:write("----- NEW TASK -----" .. "\n")
    file:write("Task Name: " .. taskName .. "\n")
    file:write("Asignees: " ..  assignees ..  "\n")
    file:write("Due Date: " ..  dueDate .. "\n")
    file:write("Other Notes: " ..  otherNotes ..  "\n")
    file:write("\n")
    file:write("----- END OF TASK -----")

    file:close()

end
app()

  
  
--   if verifyCode(enteredCode, savedCode) then
--     print("Access granted to the shared to-do list!")
--   else
--     print("Access denied. The entered code does not match the shared to-do list code.")
--   end
