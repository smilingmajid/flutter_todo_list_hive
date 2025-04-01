import 'package:get/get.dart';

import '../model/task_model.dart';

class TaskController extends GetxController {
  // Private fields
  final _tasks = <Task>[].obs;
  final _isAscending = true.obs;
  final _uniqueTitles = <String>[].obs;
  final _titleCompletionPercentages = <String, double>{}.obs;

  // Getters
  List<Task> get tasks => _tasks;
  bool get isAscending => _isAscending.value;
  List<String> get uniqueTitles => _uniqueTitles;
  Map<String, double> get titleCompletionPercentages =>
      _titleCompletionPercentages;

  @override
  void onInit() {
    super.onInit();
    _loadTasks();
  }

  void _loadTasks() {
   
    _updateUniqueTitles();
    _calculateCompletionPercentages();
  }

  void _updateUniqueTitles() {
    _uniqueTitles.value = _tasks.map((task) => task.title).toSet().toList();
  }

  void _calculateCompletionPercentages() {
    _titleCompletionPercentages.clear();
    for (String title in _uniqueTitles) {
      final tasksWithTitle =
          _tasks.where((task) => task.title == title).toList();
      if (tasksWithTitle.isNotEmpty) {
        final completedTasks =
            tasksWithTitle.where((task) => task.isDone).length;
        final percentage = (completedTasks / tasksWithTitle.length) * 100;
        _titleCompletionPercentages[title] = percentage;
      }
    }
  }

  void _sortTasks() {
    List<Task> sortedList = List<Task>.from(_tasks);
    sortedList.sort();
    if (!_isAscending.value) {
      sortedList = sortedList.reversed.toList();
    }
    _tasks.value = sortedList;
  }

  void toggleTask(String taskId) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      final task = _tasks[taskIndex];
      task.isDone = !task.isDone;
      _calculateCompletionPercentages();
    }
  }

  void deleteTask(String taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
    _updateUniqueTitles();
    _calculateCompletionPercentages();
  }

  void addTask(Task task) {
    _tasks.add(task);
    _updateUniqueTitles();
    _calculateCompletionPercentages();
  }

  void sortTasksByTitle() {
    _isAscending.value = !_isAscending.value;
    _sortTasks();
  }
}
