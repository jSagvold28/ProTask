local function createRecurringTask()
    io.write("Recurring Task: ")
    local recurringTask = io.read()

    io.write("Project (if any): ")
    local project = io.read()

    io.write("Recurring days (mon/tue/wen/thr/fri/sat/sun): ")
    local recurringDays = io.read()

    io.write("Ending date (MM-DD-YYYY or forever): ")
    local endingDate = io.read()

    local file = io.open("recuringTask.txt", "a")

    file:write("\n")
    file:write("-------New Recurring Task -----" .. "\n")
    file:write("Recurring task: " .. recurringTask .. "\n")
    file:write("Project: " .. project .. "\n")
    file:write("Starting date: " .. os.date("%M-%d-%y"))
    file:write("Ending date: " .. endingDate .. "\n")
    file:write("\n")
    
    file:close()
end

local function notifications()
    local recurringTaskFile = io.open("recuringTask.txt", "r")
    if recurringTaskFile == nil then
        print("Hey, it looks like you don't have an active recurring task. Please create a recurring task by typing 'create' when the command screen is showing.")
        return
    end

    local recurringTask = recurringTaskFile:read("*all")
    recurringTaskFile:close()

    if recurringTask == nil or recurringTask == "" then
        print("Hey, it looks like you don't have an active recurring task. Please create a recurring task by typing 'create' when the command screen is showing.")
    else -- Going onto the active notifications
        print("NOTIFICATIONS: ")
        
        print("Don't forget to do: " .. recurringTask .. " today!")
    end
end

while true do
    io.write("Hit return to go the commands")
    io.flush()
    io.read("*line")

    print("")
    print("ProTask Recurring Tasks Commands:")
    print("Format: command // what command does")
    print("")

    print("1. add // creates recurring task")
    print("2. notifs // shows notifications")

    local input = io.read()

    if input == "add" then
        createRecurringTask()
    elseif input == "notifs" then
        notifications()
    else
        print("ERROR: Hey, it looks like you entered a wrong input type. Please input a correct input.")
        print("Re-run this file to input.")
        break
    end
end
