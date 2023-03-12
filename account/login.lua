
io.write("Email: ")
    
io.write("Password: ")

local function validateUser()


    local accountFile = io.open("account.txt")

    if accountFile == nil then
        print("File does not exist. Please create an account in the .signup.lua in the folder.")
    else
        print("Login secessful!")
    end
end
validateUser()
