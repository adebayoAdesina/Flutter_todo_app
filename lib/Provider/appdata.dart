import 'dart:collection';

import 'package:flutter/material.dart';

import '../Model/task.dart';

class AppData with ChangeNotifier {
  final List<Task> _tasks = [];

  void addTask(String textEditingController) {
    final task = Task(text: textEditingController);
    _tasks.add(task);
    notifyListeners();
  }

  void toggle(Task task) {
    task.toggle();
    notifyListeners();
  }

  void deleteTodo(Task task) {
    _tasks.removeWhere((element) => element == task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
}
