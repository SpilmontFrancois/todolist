import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:http/http.dart' as http;

class TasksCollection extends ChangeNotifier {
  late List<Task> Tasks;

  TasksCollection() {
    Tasks = [];
  }

  factory TasksCollection.fromJson(List<dynamic> array) {
    TasksCollection tasksCollection = TasksCollection();
    for (var element in array) {
      tasksCollection.Tasks.add(Task.fromJson(element));
    }
    return tasksCollection;
  }

  void create(Task task) {
    Tasks.add(task);
    notifyListeners();
  }

  void update(Task task, bool completed, String content) {
    task.completed = completed;
    task.content = content;
    notifyListeners();
  }

  void delete(Task? task, BuildContext context, Function hideDetails) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Voulez-vous vraiment supprimer cette tâche ?'),
      action: SnackBarAction(
        label: 'Oui',
        onPressed: () {
          Tasks.remove(task);
          hideDetails();
          notifyListeners();
        },
      ),
    ));
  }

  getAll() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      Tasks = TasksCollection.fromJson(jsonDecode(response.body)).Tasks;
      notifyListeners();
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
