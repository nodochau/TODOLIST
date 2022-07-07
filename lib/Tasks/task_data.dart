import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> myTaskList = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy beer')
  ];
  void addNewTask(String newTaskTitle) {
    myTaskList.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  int get taskListCount {
    return myTaskList.length;
  }

  void updateTask(Task task) {
    task.toggleTask();
    notifyListeners();
  }

  void deleteTask(String name) {
    for (int i = 0; i < myTaskList.length; i++) {
      if (myTaskList[i].name == name) {
        myTaskList.remove(myTaskList[i]);
      }
    }
    notifyListeners();
  }
}
