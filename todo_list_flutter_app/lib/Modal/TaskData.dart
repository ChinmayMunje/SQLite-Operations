import 'package:flutter/foundation.dart';
import 'package:todo_list_flutter_app/Modal/Task_modal.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {

  List< Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy NewsPaper'),
    Task(name: 'Buy Grocery'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }
 void addTask (String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
 }

 void updateTask (Task task){
    task.toggleDone();
    notifyListeners();

 }

 void delete (Task task){
    _tasks.remove(task);
    notifyListeners();
 }
}

