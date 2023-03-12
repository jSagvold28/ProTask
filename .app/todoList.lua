local todo_list = {}

local function addTask()

    io.write("Task name: ")
    local task = io.read("*line")

    io.write("Due date (MM-DD-YYYY): ")
    local dueDate = io.read("*line")
    if dueDate == "" then dueDate = nil end

    io.write("Priority (Low//Medium//High//Top): ")
    local priority = io.read("*line")
    if priority == "" then priority = nil end

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

    file:write("-------New Task -----" .. "\n")
    file:write("Task name: " .. task .. "\n")
    file:write("Due date: " .. dueDate .. "\n")
    file:write("Priority: " .. priority .. "\n")
    file:write("Sub tasks: " .. subtasksStr .. "\n")
    file:write("Date added: " .. os.date('%M-%d-%y %H:%M:%S') .. "\n")

    file:close()
    print("Task added! Check the explorer for: taskList.txt")

    io.write("Enter this to go to the list of commands")
end

local function completeTask()
    io.write("Task index: ")
    local taskFile = io.open("taskList.txt", "r")
    local taskIndex = tonumber(io.read("*line"))

    if todo_list[taskIndex] then
        todo_list[taskIndex].completed = true

        local randomCookieAmounts = {}
        for i = 1, 15 do
            table.insert(randomCookieAmounts, i)
        end

        local randomIndex = math.random(1, #randomCookieAmounts)
        print("Congratulations on completing that task! Here's: " ..
                  randomCookieAmounts[randomIndex])
    end
    
    io.close(taskFile)
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
    print(" ")

    print("1. add task")
    print("2. complete task")
    print("3. get todo list")
    print("4. exit")
    print("") -- spacer

    local input = io.read()

    if input == "add task" then
        addTask()
    elseif input == "complete task" then
        completeTask()
    elseif input == "get todo list" then
        printTodoList()
    elseif input == "exit" then
        exitProgram()
    else
        print("ERROR: invalid input. Please try again with the prompts above")
    end
end
