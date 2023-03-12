local todo_list = {}

local function addTask()

    io.write("Task name: ")
    local task = io.read("*line")


    io.write("Due date (YYYY-MM-DD): ")
    local dueDate = io.read("*line")
    if dueDate == "" then dueDate = nil end


    io.write("Priority (High/Medium/Low): ")
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
    
    file:close()
end


local function completeTask()

    io.write("Task index: ")
    local taskIndex = tonumber(io.read("*line"))


    if todo_list[taskIndex] then
        todo_list[taskIndex].completed = true

        print("Congratulations on completing that task! Here's a cookie.")
    else

        print("Error: Task not found.")
    end
end


local function printTodoList()

    print(string.format("%-3s %-20s %-12s %-10s %s", "ID", "Task", "Due Date",
                        "Priority", "Subtasks"))
    print(string.rep("-", 60))

    for i, task in ipairs(todo_list) do
        local taskStr = string.format("%-3d %-20s %-12s %-10s %s", i, task.task,
                                      task.dueDate or "-", task.priority or "-",
                                      table.concat(task.subtasks, ", ") or "-")
        if task.completed then taskStr = taskStr .. " (Completed)" end
        print(taskStr)
    end
end


local function exitProgram()
    print("Exiting")
    os.exit()
end


while true do

    print("")
    print("1. add task")
    print("2. complete task")
    print("3. get todo list")
    print("4. exit")

    local input = io.read()

    if input == "add task" then
        addTask()
    elseif input == "complete task" then
        completeTask()
    elseif input == "get todo list" then
        printTodoList()
    elseif input == "exit" then
        exitProgram()
    end
end
