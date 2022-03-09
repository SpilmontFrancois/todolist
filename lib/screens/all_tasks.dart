import 'package:flutter/material.dart';
import 'package:todolist/data/tasks.dart' as data;
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/components/tasks/task_details.dart';
import 'package:todolist/models/task.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  Task? selectedTask;

  void showDetails(Task task) {
    setState(() {
      selectedTask = task;
    });
  }

  void hideDetails() {
    setState(() {
      selectedTask = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              selectedTask != null
                  ? TaskDetails(task: selectedTask, hideDetails: hideDetails)
                  : Container(),
              TaskMaster(
                tasks: data.tasks,
                showDetails: showDetails,
              ),
            ],
          ),
        ));
  }
}
