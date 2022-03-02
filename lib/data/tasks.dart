import 'package:todolist/models/task.dart';
import 'package:faker/faker.dart';
import 'dart:math';

//Task(1, 'Task 1', false, DateTime(2022, 02, 01))

var tasks = List<Task>.generate(
    30,
    (index) => Task(
        index, faker.lorem.sentence(), Random().nextBool(), DateTime.now()));
