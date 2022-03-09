import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({Key? key, required this.task, required this.hideDetails})
      : super(key: key);

  final Task? task;
  final Function hideDetails;

  void close() {
    hideDetails();
  }

  @override
  Widget build(BuildContext context) {
    Widget getIconAccordingToCompleted() {
      return (task!.completed)
          ? const Icon(Icons.check)
          : const Icon(Icons.timelapse);
    }

    return Column(
      children: [
        IconButton(onPressed: () => close(), icon: const Icon(Icons.close)),
        getIconAccordingToCompleted(),
        Text(task!.content),
        Text(task!.createdAt.toString())
      ],
    );
  }
}
