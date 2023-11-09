// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.5.0;

contract TodoList {
   //keep track of numbers of tasks that are in the to do list
   uint public taskCount = 0;

//define the structure of the tasks
   struct Task {
      uint id;
      string content;
      bool completed;
   }
// mapping the tasks with their id
   mapping(uint => Task) public tasks;

   event TaskCreated(
      uint id,
      string content,
      bool completed
   );
   //task completed event
   event TaskCompleted(
    uint id,
    bool completed
  );

//constructor to add a default task to the to do list
constructor() public {
   createTask("Complete your first todo list app with etherium");
}

// create tasks and then push it into the mapping , which works as our database
function createTask(string memory _content) public {
   taskCount ++;
   tasks[taskCount] = Task(taskCount, _content, false);
   emit TaskCreated(taskCount, _content, false);
}
//task completed to check
function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }
}