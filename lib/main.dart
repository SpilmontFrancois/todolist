import 'package:flutter/material.dart';

import 'package:todolist/screens/all_tasks.dart';

void main() {
  runApp(const TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Outfit',
      ),
      home: const AllTasks(title: 'Liste des tâches'),
    );
  }
}
