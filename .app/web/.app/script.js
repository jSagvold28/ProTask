const addTaskForm = document.getElementById('add-task-form');
const addTaskInput = document.getElementById('add-task-input');
const taskList = document.getElementById('task-list');

addTaskForm.addEventListener('submit', (e) => {
  e.preventDefault();
  const taskName = addTaskInput.value;
  if (taskName) {
    const taskItem = createTaskItem(taskName);
    taskList.appendChild(taskItem);
    addTaskInput.value = '';
  }
});

function createTaskItem(taskName) {
  const taskItem = document.createElement('li');
  const taskCheckbox = document.createElement('input');
  taskCheckbox.type = 'checkbox';
  taskCheckbox.className = 'task-checkbox';
  const taskLabel = document.createElement('label');
  taskLabel.textContent = taskName;
  taskItem.appendChild(taskCheckbox);
  taskItem.appendChild(taskLabel);

  // Add event listener to task checkbox
  taskCheckbox.addEventListener('change', () => {
    if (taskCheckbox.checked) {
      taskItem.classList.add('completed');
      setTimeout(() => {
        taskItem.remove();
      }, 1000);
    }
  });

  return taskItem;
}
