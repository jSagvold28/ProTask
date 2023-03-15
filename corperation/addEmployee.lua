local function addEmployee()

    io.write("Employee Name: ")
    local employeeName = io.read()

    repeat
        io.write("Employee Email: ")
        employeeEmail = io.read()

        -- Check if the email matches the pattern
        if employeeEmail:match(".+@.+%.com$") or employeeEmail:match(".+@.+%.org$") 
        or employeeEmail:match(".+@.+%.edu$")
        or employeeEmail:match(".+@.+%.net$")
        or employeeEmail:match(".+@.+%.io$")
        or employeeEmail:match(".+@.+%.me$")
        or employeeEmail:match(".+@.+%.ca$")
        or employeeEmail:match(".+@.+%.tech$")
        or employeeEmail:match(".+@.+%.ai$")
        or employeeEmail:match(".+@.+%.studio$")
        or employeeEmail:match(".+@.+%.gov$")
        then
            -- Valid email address
            break
        else
            -- Invalid email address
            print("Invalid email address. Please enter a valid email address.")
        end
    until false

    io.write("Employee Password: ")
    local employeePassword = io.read()

    io.write("Employee Role: ")
    local employeeRole = io.read()

    -- write employee

    print("")
    print("Type 'yes' to create an employee named: " .. employeeName)

    io.flush()
    local input = io.read()
    if input == "yes" then

        local file = io.open("corp_employees.txt", "a")

        file:write("\n")
        file:write("----- New Employee -----\n")
        file:write("Employee name: ", employeeName, "\n")
        file:write("Employee Password: " .. employeePassword .. "\n")
        file:write("Employee Role: " .. employeeRole .. "\n")
        
        file:close()
        


    end
end

while true do
    addEmployee()
end

