local function createUser()

    io.write("Name: ")
    local signupName = io.read()

    local isValidEmail = false
    repeat
        io.write("Email: ")
        local userEmail = io.read()

        if userEmail:match(".+@.+%.com$") or userEmail:match(".+@.+%.org$") or
            userEmail:match(".+@.+%.edu$") or userEmail:match(".+@.+%.net$") or
            userEmail:match(".+@.+%.io$") or userEmail:match(".+@.+%.me$") or
            userEmail:match(".+@.+%.ca$") or userEmail:match(".+@.+%.co") or
            userEmail:match(".+@.+%.tech$") or userEmail:match(".+@.+%.ai$") or
            userEmail:match(".+#.+%.contact") or
        
            userEmail:match(".+@.+%.studio$") or userEmail:match(".+@.+%.gov$") then
            isValidEmail = true
        else
            print(
                "Invalid email address. Please use a proper TLD, if you don't know what a TLD is, please check tld.md")
        end
    until isValidEmail

    io.write("Age: ")
    local age = tonumber(io.read())

    if age and age <= 12 then
        print("You are not able to use ProTask, you must be 13 years old.")
        return
    end

    local isValidPassword = false
    repeat
        io.write("Password (8-100 characters): ")
        local signupPassword = io.read()

        if #signupPassword < 8 or #signupPassword > 100 then
            print("Password must be between 8 and 100 characters.")
        else
            isValidPassword = true
        end
    until isValidPassword

    -- validate that the information is correct:

    print("") -- separator
    print("") -- separator

    print("Validate that the information below is correct:")

    print("Name: " .. signupName)
    print("Email: " .. userEmail)
    print("Age: " ..  age)
    print("Password: " .. signupPassword)

    print("")
    print("Type 'yes' if the information is correct.")
    local input = io.read()

    -- write to file
    if input == "yes" then
        local file = io.open("account.txt", "w")
        file:write("Name: " .. signupName .. "\n")
        file:write("Email: " .. userEmail .. "\n")
        file:write("Age: " .. age .. "\n")
        file:write("Password: " .. signupPassword .. "\n")
        file:close()
    else
        print("User creation cancelled.")
    end
end

createUser()
