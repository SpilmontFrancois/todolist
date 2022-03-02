import 'package:flutter/material.dart';
import 'package:todolist/data/tasks.dart' as data;
import 'package:todolist/components/tasks/task_master.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
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
              TaskMaster(
                tasks: data.tasks,
              ),
            ],
          ),
        ));
  }
}
