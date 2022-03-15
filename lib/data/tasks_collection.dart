import 'package:flutter/cupertino.dart';
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

  void delete(Task task) {
    data.tasks.remove(task);
    notifyListeners();
  }
}
