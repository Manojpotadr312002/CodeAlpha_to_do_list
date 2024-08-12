<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced To-Do List</title>
    <link rel="stylesheet" href="styles.css">
</head>
  <style>
    /* General Styles */
body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(to right, #49f87e, #2657fb);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

/* Container */
.container {
    background: linear-gradient(to right, #4264d4, #62f27c);
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0.2, 0.2, 0, 0.4);
    width: 450px;
    text-align: center;
}

/* Heading */
h1 {
    margin-bottom: 20px;
    color: #110101;
    font-size: 26px;
}

/* Input Group */
.input-group {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
    gap: 10px;
}

#taskInput {
    width: 45%;
    padding: 12px 15px;
    border: 2px solid #ddd;
    border-radius: 5px;
    outline: none;
    font-size: 16px;
}

#taskTime {
    width: 40%;
    padding: 12px 15px;
    border: 2px solid #ddd;
    border-radius: 5px;
    outline: none;
    font-size: 16px;
}

#addTaskBtn {
    padding: 12px 20px;
    background-color: #6a11cb;
    color: white;
    border: none;
    cursor: pointer;
    font-size: 24px;
    transition: background-color 0.3s;
}

#addTaskBtn:hover {
    background-color: #2575fc;
}

/* Task List */
ul {
    list-style-type: none;
    padding: 0;
}

li {
    background-color: #f9f9f9;
    padding: 15px;
    border-radius: 10px;
    margin-bottom: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s, transform 0.2s;
}

li:hover {
    background-color: #eee;
    transform: translateY(-3px);
}

li.completed {
    text-decoration: line-through;
    color: #999;
}

/* Task Controls */
.task-controls {
    display: flex;
    gap: 5px;
}

button {
    border: none;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button.deleteBtn {
    background-color: #e91026;
    color: white;
}

button.deleteBtn:hover {
    background-color: #e24050;
}

button.editBtn {
    background-color: #f5b803;
    color: white;
}

button.editBtn:hover {
    background-color: #f0c544;
}

.task-time {
    font-size: 12px;
    color: #666;
    margin-top: 5px;
}

  </style>
<body>
    <div class="container">
        <h1>Advanced To-Do List</h1>
        <div class="input-group">
            <input type="text" id="taskInput" placeholder="Enter a new task">
            <input type="datetime-local" id="taskTime">
            <button id="addTaskBtn">+</button>
        </div>
        <ul id="taskList"></ul>
    </div>
    <script>
        document.getElementById('addTaskBtn').addEventListener('click', addTask);
document.getElementById('taskInput').addEventListener('keydown', (e) => {
    if (e.key === 'Enter') {
        addTask();
    }
});

function addTask() {
    const taskInput = document.getElementById('taskInput');
    const taskTimeInput = document.getElementById('taskTime');
    const task = taskInput.value.trim();
    const taskTime = taskTimeInput.value;

    if (task === '') {
        alert('Please enter a task.');
        return;
    }

    const taskList = document.getElementById('taskList');
    const li = document.createElement('li');

    const taskText = document.createElement('span');
    taskText.textContent = task;

    const taskTimeDisplay = document.createElement('div');
    taskTimeDisplay.textContent = `Scheduled: ${taskTime ? new Date(taskTime).toLocaleString() : "No time set"}`;
    taskTimeDisplay.classList.add('task-time');

    const controls = document.createElement('div');
    controls.classList.add('task-controls');

    const deleteBtn = document.createElement('button');
    deleteBtn.textContent = 'Delete';
    deleteBtn.classList.add('deleteBtn');
    deleteBtn.addEventListener('click', () => {
        taskList.removeChild(li);
    });

    const editBtn = document.createElement('button');
    editBtn.textContent = 'Edit';
    editBtn.classList.add('editBtn');
    editBtn.addEventListener('click', () => {
        editTask(taskText, taskTimeDisplay, taskTimeInput, li);
    });

    controls.appendChild(editBtn);
    controls.appendChild(deleteBtn);

    li.appendChild(taskText);
    li.appendChild(taskTimeDisplay);
    li.appendChild(controls);

    taskList.appendChild(li);

    taskInput.value = '';
    taskTimeInput.value = '';

    li.addEventListener('click', () => {
        li.classList.toggle('completed');
    });
}

function editTask(taskText, taskTimeDisplay, taskTimeInput, listItem) {
    const newTask = prompt('Edit your task:', taskText.textContent);
    const newTime = prompt('Edit your time:', taskTimeInput.value);

    if (newTask !== null && newTask.trim() !== '') {
        taskText.textContent = newTask;
        taskTimeDisplay.textContent = `Scheduled: ${newTime ? new Date(newTime).toLocaleString() : "No time set"}`;
    }
}

    </script>
</body>
</html>