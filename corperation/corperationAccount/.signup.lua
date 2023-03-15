local corpName, corpEmail, corpPassword, corpWebsiteURL, corpNumberOfEmployees, corpAdminPin

local function createCorperation()

    io.write("Corporation Name: ")
    corpName = io.read()

    repeat
        io.write("Corporation Email: ")
        corpEmail = io.read()

        -- Check if the email matches the pattern
        if corpEmail:match(".+@.+%.com$") or corpEmail:match(".+@.+%.org$") 
        or corpEmail:match(".+@.+%.edu$")
        or corpEmail:match(".+@.+%.net$")
        or corpEmail:match(".+@.+%.io$")
        or corpEmail:match(".+@.+%.me$")
        or corpEmail:match(".+@.+%.ca$")
        or corpEmail:match(".+@.+%.tech$")
        or corpEmail:match(".+@.+%.ai$")
        or corpEmail:match(".+@.+%.studio$")
        or corpEmail:match(".+@.+%.gov$")
        then
            -- Valid email address
            break
        else
            -- Invalid email address
            print("Invalid email address. Please enter a valid email address.")
        end
    until false

    io.write("Corporation Password (enter password): ")
    corpPassword = io.read()

    io.write("Corporation website URL: ")
    corpWebsiteURL = io.read()

    io.write("Number of Employees (can add more later): ")
    corpNumberOfEmployees = io.read()

    io.write("Admin Pin: ")
    corpAdminPin = io.read()

end

createCorperation()

local function writeCorperationDataToFile()

    print("")
    print("Validate that the information below is correct:")
    print("")

    print("Corporation name: " .. corpName)
    print("Corporation email: " .. corpEmail)
    print("Corporation password: " .. corpPassword)
    print("Corporation website URL: " .. corpWebsiteURL)
    print("Corporation total number of employees: " .. corpNumberOfEmployees)
    print("Admin Pin: " .. corpAdminPin)

    print("")
    print("Type 'yes' if the information above is correct.")

    local input = io.read()

    if input == "yes" then

        local file = io.open("corpAccount.txt", "w")

        file:write("Corporation name: " .. corpName .. "\n")
        file:write("Corporation email: " .. corpEmail .. "\n")
        file:write("Corporation password: " .. corpPassword .. "\n")
        file:write("Corporation website URL: " .. corpWebsiteURL .. "\n")
        file:write("Corporation total number of employees: " .. corpNumberOfEmployees .. "\n")
        file:write("Admin Pin: " .. corpAdminPin .. "\n")

        file:close()

        print("Welcome, " .. corpName .. "! Were exited to have you as a corperation using ProTask!")

    end
end

writeCorperationDataToFile()
