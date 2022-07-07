import 'package:flutter/material.dart';
import 'package:todo/Tasks/tasks_title.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return TaskTile(
          isChecked: Provider.of<TaskData>(context).myTaskList[index].isDone,
          taskTitle: Provider.of<TaskData>(context).myTaskList[index].name,
          checkBoxcallBack: (boxState) {
            Provider.of<TaskData>(context, listen: false).updateTask(
                Provider.of<TaskData>(context, listen: false)
                    .myTaskList[index]);
          },
        );
      },
      itemCount: Provider.of<TaskData>(context).taskListCount,
    );
  }
}
