import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/data/tasks.dart' as data;
import 'package:todolist/models/task.dart';

class TasksCollection extends ChangeNotifier {
  void create(Task task) {
    data.tasks.add(task);
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }

  void delete(Task? task, BuildContext context, Function hideDetails) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Voulez-vous vraiment supprimer cette tâche ?'),
      action: SnackBarAction(
        label: 'Oui',
        onPressed: () {
          data.tasks.remove(task);
          hideDetails();
        },
      ),
    ));
    notifyListeners();
  }
}
