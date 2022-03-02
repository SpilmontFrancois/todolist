import 'package:todolist/models/task.dart';
import 'package:faker/faker.dart';

//Task(1, 'Task 1', false, DateTime(2022, 02, 01))
main() {
  var faker = new Faker();
  List<Task> myList = [];
  for (var i = 0; i < 15; i++) {
    myList.add(Task(i, faker.lorem.words(2).toString(),
        i % 2 == 0 ? true : false, DateTime.now()));
  }
}
