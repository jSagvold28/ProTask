local todo_list = {}

print("") -- spacer

local function addTaskApp()
    io.write("Task name: ")
    local task = io.read("*line")

    io.write("Project: ")
    local project = io.read()

    io.write("Due date (MM-DD-YYYY): ")
    local dueDate = io.read("*line")
    if dueDate == "" then
        dueDate = nil
    end

    io.write("Priority (Low/Medium/High/Top): ")
    local priority = io.read("*line")
    if priority == "" then
        priority = nil
    end

    io.write("Subtasks (separated by commas): ")
    local subtasksStr = io.read("*line")
    local subtasks = {}
    if subtasksStr ~= "" then
        for subtask in string.gmatch(subtasksStr, "[^,%s]+") do
            table.insert(subtasks, subtask)
        end
    end

    io.write("Labels: ")
    local labels = io.read()

    local newTask = {
        task = task,
        project = project,
        dueDate = dueDate,
        priority = priority,
        subtasks = subtasks,
        labels = labels,
        completed = false
    }
    table.insert(todo_list, newTask)

    local file = io.open("taskList.txt", "a")
    if file then
        file:write("\n")
        file:write("-------New Task -----\n")
        file:write("Task name: " .. task .. "\n")
        file:write("Project: " .. project .. "\n")
        file:write("Due date: " .. (dueDate or "") .. "\n")
        file:write("Priority: " .. (priority or "") .. "\n")
        file:write("Subtasks: " .. table.concat(subtasks, ", ") .. "\n")
        file:write("Labels: " .. labels .. "\n")
        file:write("Date added: " .. os.date('%m-%d-%Y %H:%M:%S') .. "\n")
        file:close()
        print("Task added! Check the explorer for: taskList.txt")
    else
        print("ERROR: could not write data to file.")
    end
end



local plusFile = io.open("plusInfo.txt")

if plusFile == nil then
    print("ERROR 404: Plus subscription does not exist. Please create a Plus subscription if you would like to use this feature.")
    print("Path for getting Plus: plus/plusAccount/createSubscription.lua")
-- end
else

    while true do

        io.write("Press enter to reveal commands ")
        io.flush()
        io.read("*line")

        print("") -- spacer
        print("Commands: ")
        print("") -- spacer

        --  commands:
        print("Format: command - what command does")

        print("add task - adds a task to the ToDo list")
        print("exit - ends Productivity Center") -- do not remove

        print("") -- spacer between text and user input
        

        local input = io.read()

        if input == "add task" then
            addTaskApp()
        elseif input == "exit" then
            break
        end
    end
end
