import 'package:flutter/material.dart';
import 'package:todo/Tasks/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  //final Function newTaskAdded;
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
                textAlign: TextAlign.center,
                showCursor: true,
                autofocus: true,
                onChanged: (newText) {
                  newTaskTitle = newText;
                }),
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.lightBlueAccent,
                  ),
                ),
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addNewTask(newTaskTitle);
                  Navigator.pop(context);
                },
                child: const Text(
                  'ADD',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
