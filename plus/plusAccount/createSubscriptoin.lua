local function createSubscription()

    io.write("Name: ")
    local name = io.read()
    
    repeat
      print("Email:")
      local userEmail = io.read()

      if userEmail:match(".+@.+%.com$") or userEmail:match(".+@.+%.org$") 
      or userEmail:match(".+@.+%.edu$")
      or userEmail:match(".+@.+%.net$")
      or userEmail:match(".+@.+%.io$")
      or userEmail:match(".+@.+%.me$")
      or userEmail:match(".+@.+%.ca$")
      or userEmail:match(".+@.+%.co")
      or userEmail:match(".+@.+%.tech$")
      or userEmail:match(".+@.+%.ai$")
      or userEmail:match(".+@.+%.studio$")
      or userEmail:match(".+@.+%.gov$")
      then
          break
      else
          print("Invalid email address. Please use a proper TLD, if you don't know what a TLD is, please check tld.md")
      end
  until false

  io.write("Password (8-100 characters): ")
  local password = io.read()

  if #password < 8 or #password > 100 then
    print("Password must be between 8 to 100 characters.")
    return
  end


    io.write("Age: ")
    local age = tonumber(io.read())

    if age < 18 then
      print("You must be 18 to have a Plus subscription")
      return
    end

    io.write("Credit card number: ")
    local ccNumber = io.read()
      
    io.write("Billing Selection: Monthly $0.00 or yearly $0.00: ")
    local billingSeleciton = io.read()

    print("")
    print("Valdiate that the information below is correct:")
    print("")

    print("Account created! Welcome " .. name .. "!")
    print("Name: " .. name)
    print("Email: " .. userEmail)
    print("Password: " .. password)
    print("Age: " .. age)
    print("CC Number: " .. ccNumber)
    print("Billing Selection: " .. billingSeleciton)

    print("Type 'yes' if you would like to create an account, and the information is correct.")

    local input = io.read()

    if input == "yes" then
        -- create file

        local file = io.open("subscription.txt", "w")

        file:write("Name: " .. name .. "\n")
        file:write("Email: " .. userEmail .. "\n")
        file:write("Password: " .. password .. "\n")
        file:write("Age: " .. age .. "\n")
        file:write("CC Number: " .. ccNumber .. "\n")
        file:write("Billing selection: " .. billingSeleciton .. "\n")
        
        file:close()
        
    end
end

local accountFile, err = io.open("account.txt")

if not accountFile then
    print("")
    print("Error opening account file: " .. err)
    print("You must have an active Plus subscription to create a Plus account.")
    print("Path: account/accountDetails/.signup.lua")
    print("")
else
    createSubscription()
end
