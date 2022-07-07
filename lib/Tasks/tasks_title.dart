import 'package:flutter/material.dart';
import 'task_data.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkBoxcallBack;

  const TaskTile({
    Key? key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkBoxcallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(taskTitle),
        onDismissed: (direction) {
          Provider.of<TaskData>(context, listen: false).deleteTask(taskTitle);
        },
        background: Container(
          color: const Color.fromARGB(255, 198, 19, 7),
          child: const Center(
            child: Text(
              'Deleting....Deleting...Deleting',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
        ),
        child: ListTile(
          // onLongPress: () {
          //   Provider.of<TaskData>(context, listen: false).deleteTask(taskTitle);
          // },
          title: Text(
            taskTitle,
            style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: checkBoxcallBack,
          ),
        ));
  }
}
