import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/task_model.dart';

class TaskController extends GetxController {
  // Private fields
  final _taskBox = Hive.box<Task>('tasks');
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

  Future<void> _loadTasks() async {
    try {
      _tasks.value = _taskBox.values.toList();
      _updateUniqueTitles();
      _calculateCompletionPercentages();
      _sortTasks();
    } catch (e) {
      Get.snackbar(
        'خطا',
        'خطا در بارگذاری تسک‌ها',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
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

  Future<void> addTask(Task task) async {
    try {
      await _taskBox.add(task);
      _tasks.add(task);
      _updateUniqueTitles();
      _calculateCompletionPercentages();
      _sortTasks();
      Get.snackbar(
        'موفق',
        'تسک با موفقیت اضافه شد',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'خطا',
        'خطا در افزودن تسک',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        await _taskBox.putAt(index, task);
        _tasks[index] = task;
        _updateUniqueTitles();
        _calculateCompletionPercentages();
        _sortTasks();
        Get.snackbar(
          'موفق',
          'تسک با موفقیت به‌روزرسانی شد',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطا',
        'خطا در به‌روزرسانی تسک',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      final index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        await _taskBox.deleteAt(index);
        _tasks.removeAt(index);
        _updateUniqueTitles();
        _calculateCompletionPercentages();
        _sortTasks();
        Get.snackbar(
          'موفق',
          'تسک با موفقیت حذف شد',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطا',
        'خطا در حذف تسک',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void toggleTaskStatus(Task task) {
    task.isDone = !task.isDone;
    updateTask(task);
  }

  void sortTasksByTitle() {
    _isAscending.value = !_isAscending.value;
    _sortTasks();
  }
}
