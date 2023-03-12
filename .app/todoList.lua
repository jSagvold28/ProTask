local todo_list = {}

local function addTask()
    -- prompt the user for the task name
    io.write("Task name: ")
    local task = io.read("*line")

    -- prompt the user for the due date (optional)
    io.write("Due date (YYYY-MM-DD): ")
    local dueDate = io.read("*line")
    if dueDate == "" then dueDate = nil end

    -- prompt the user for the priority (optional)
    io.write("Priority (High/Medium/Low): ")
    local priority = io.read("*line")
    if priority == "" then priority = nil end

    -- prompt the user for the subtasks (optional)
    io.write("Subtasks (separated by commas): ")
    local subtasksStr = io.read("*line")
    local subtasks = {}
    if subtasksStr ~= "" then
        for subtask in string.gmatch(subtasksStr, "%S+") do
            table.insert(subtasks, subtask)
        end
    end

    -- create a new task object with the given parameters
    local newTask = {
        task = task,
        dueDate = dueDate,
        priority = priority,
        subtasks = subtasks,
        completed = false
    }

    -- add the new task to the to-do list
    table.insert(todo_list, newTask)
end

-- define a local function to mark a task as completed
local function completeTask()
    -- prompt the user for the task index
    io.write("Task index: ")
    local taskIndex = tonumber(io.read("*line"))

    -- check if the task exists in the to-do list
    if todo_list[taskIndex] then
        -- mark the task as completed
        todo_list[taskIndex].completed = true
        -- congratulate the user and give them a cookie
        print("Congratulations on completing that task! Here's a cookie.")
    else
        -- if the task doesn't exist, print an error message
        print("Error: Task not found.")
    end
end

-- define a local function to print the to-do list
local function printTodoList()
    -- print the header
    print(string.format("%-3s %-20s %-12s %-10s %s", "ID", "Task", "Due Date",
                        "Priority", "Subtasks"))
    print(string.rep("-", 60))

    -- print each task in the to-do list
    for i, task in ipairs(todo_list) do
        local taskStr = string.format("%-3d %-20s %-12s %-10s %s", i, task.task,
                                      task.dueDate or "-", task.priority or "-",
                                      table.concat(task.subtasks, ", ") or "-")
        if task.completed then taskStr = taskStr .. " (Completed)" end
        print(taskStr)
    end
end

-- define a local function to exit the program
local function exitProgram()
    -- print a goodbye message
    print("Goodbye!")
    -- exit the program
    os.exit()
end

-- main loop
while true do
    -- print the menu
    print("")
    print("1. Add task")
    print("2. Complete task")
    print("3. Print to-do list")
    print("4. Exit")

    local input = io.read()

    if input == "Add task" then
        addTask()
    elseif input == "Complete task" then
        completeTask()
    elseif input == "Print to-do list" then
        printTodoList()
    elseif input == "Exit" then
        exitProgram()
    end
end
