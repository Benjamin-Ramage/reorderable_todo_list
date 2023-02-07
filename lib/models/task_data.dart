import 'package:flutter/cupertino.dart';
import 'package:reorderable_todo_list/models/task.dart';

class TaskData extends ChangeNotifier{
  final List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy cheese'),
  ];

  List<Task> get tasks {
    return _tasks;
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(
      name: newTaskTitle,
    );
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}