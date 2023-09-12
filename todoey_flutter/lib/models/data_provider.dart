import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class Data with ChangeNotifier{

  List<Task> tasks = [Task("Buy groceries"), Task("asd"), Task("Vacuum")];

  void addTask(String newTaskName){
    tasks.add(Task(newTaskName));
    notifyListeners();
  }

  int get taskCount => tasks.length;
}