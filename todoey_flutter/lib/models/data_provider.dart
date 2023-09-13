import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class Data with ChangeNotifier{

  List<Task> _tasks = [Task("Buy groceries"), Task("asd"), Task("Vacuum")];

  void addTask(String newTaskName){
    _tasks.add(Task(newTaskName));
    notifyListeners();
  }


  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}