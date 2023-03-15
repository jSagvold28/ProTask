
local todo_list = {}

local function addTask()

    io.write("Task name: ")
    local task = io.read("*line")

    io.write("Project: ")
    local project = io.read()

    io.write("Due date (MM-DD-YYYY): ")
    local dueDate = io.read("*line")
    if dueDate == "" then dueDate = nil end

    io.write("Priority (Low//Medium//High//Top): ")
    local priority = io.read("*line")
    if priority == "" then priority = nil end

    io.write("Lables: ")
    local lables = io.read()


    io.write("Subtasks (separated by commas): ")
    local subtasksStr = io.read("*line")
    local subtasks = {}
    if subtasksStr ~= "" then
        for subtask in string.gmatch(subtasksStr, "%S+") do
            table.insert(subtasks, subtask)
        end
    end

    local newTask = {
        task = task,
        dueDate = dueDate,
        priority = priority,
        subtasks = subtasks,
        completed = false
    }
    table.insert(todo_list, newTask)

    local file = io.open("taskList.txt", "a")

    file:write("\n")
    file:write("-------New Task -----" .. "\n")
    file:write("Task name: " .. task .. "\n")
    file:write("Project: " .. project .. "\n")
    file:write("Due date: " .. (dueDate or "") .. "\n")
    file:write("Priority: " .. (priority or "") .. "\n")
    file:write("Lables: " .. lables .. "\n")
    file:write("Sub tasks: " .. (subtasksStr or "") .. "\n")
    file:write("Date added: " .. os.date('%m-%d-%Y %H:%M:%S') .. "\n")
    file:write("\n")

    file:close()
    print("") -- spacer
    print("Task added! Check the explorer for: taskList.txt")
end

local function completeTask()
    io.write("Task index: ")
    local taskIndex = tonumber(io.read("*line"))

    -- Define cookieAmounts as a table
    local cookieAmounts = {"1 cookie", "2 cookies", "4 cookies", "10 cookies"}

    -- Select a random cookie amount from the table
    local randomIndex = math.random(#cookieAmounts)
    local randomCookieAmounts = cookieAmounts[randomIndex]
    
    local cookieFile = io.open("totalCookies.txt", 'w')
    cookieFile:write(randomCookieAmounts)
    cookieFile:close()
    

    -- Print the result
    print("Congrats on completing task " .. taskIndex .. "! Here is " ..
              randomCookieAmounts)

    if todo_list[taskIndex] then
        todo_list[taskIndex].completed = true

        local randomCookieAmounts = {}
        for i = 1, 15 do table.insert(randomCookieAmounts, i) end

        local randomIndex = math.random(1, #randomCookieAmounts)
        print("Congratulations on completing that task! Here's: " ..
                  randomCookieAmounts[randomIndex])
    end
end

local function printTodoList()
    for i, task in ipairs(todo_list) do
        print("Task " .. i .. ":")
        print("  Task name: " .. task.task)
        print("  Due date: " .. (task.dueDate or ""))
        print("  Priority: " .. (task.priority or ""))
        print("  Subtasks: " .. table.concat(task.subtasks, ", "))
        print("  Completed: " .. (task.completed and "Yes" or "No"))
    end
end

local function exitProgram()
    print("Exiting")
    os.execute("sleep 0.2")
    print("Exited in 0.2s")
    os.exit()
end

while true do
    print("")
    io.write("Press enter to view the commands: ")
    io.flush()
    io.read("*line")

    print("")
    print("ProTask Commands:")
    print("Format: command // what command does")
    print(" ")

    print("1. add // adds a task")
    print("2. complete // completes a task")
    print("3. get todo list // gets the todo list")
    print("4. exit // exits and stops the rest of the outputted elements")
    print("") -- spacer

    local input = io.read()

    if input == "add" then
        addTask()
    elseif input == "complete" then
        completeTask()
    elseif input == "get todo list" then
        printTodoList()
    elseif input == "exit" then
        exitProgram()
    else
        print("ERROR: invalid input. Please try again with the prompts above")
    end
end
