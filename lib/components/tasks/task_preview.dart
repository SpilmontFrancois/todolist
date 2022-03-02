import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskPreview extends StatefulWidget {
  const TaskPreview({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  State<TaskPreview> createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task.content),
      onTap: () {
        setState(() {
          widget.task.completed = !widget.task.completed;
        });
      },
      trailing: Checkbox(
        value: widget.task.completed,
        onChanged: (value) {
          setState(() {
            widget.task.completed = value!;
          });
        },
      ),
    );
  }
}
