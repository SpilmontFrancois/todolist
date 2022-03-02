import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/models/task.dart';

class TaskMaster extends StatefulWidget {
  const TaskMaster({Key? key, required this.tasks}) : super(key: key);

  final List<Task> tasks;

  @override
  State<TaskMaster> createState() => _TaskMasterState();
}

class _TaskMasterState extends State<TaskMaster> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: widget.tasks.length,
            itemBuilder: (context, index) {
              final task = widget.tasks[index];
              return TaskPreview(task: task);
            }));
  }
}
