import 'dart:ffi';

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
  bool showSnackBar = false;

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

  void deleteTask(Task task) {
    data.tasks.remove(task);
    hideDetails();
  }

  void confirmDelete(Task task) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Voulez-vous vraiment supprimer cette tâche ?'),
      action: SnackBarAction(
        label: 'Oui',
        onPressed: () => deleteTask(task),
      ),
    ));
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
                  ? TaskDetails(
                      task: selectedTask,
                      hideDetails: hideDetails,
                      confirmDelete: confirmDelete,
                    )
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
