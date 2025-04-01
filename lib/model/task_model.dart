import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject implements Comparable<Task> {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String category;

  @HiveField(3)
  DateTime dueDate;

  @HiveField(4)
  bool isDone;

  @HiveField(5)
  String description;

  Task({
    String? id,
    required this.title,
    required this.category,
    required this.dueDate,
    this.isDone = false,
    this.description = '',
  }) : id = id ?? const Uuid().v4();

  @override
  int compareTo(Task other) {
    return title.compareTo(other.title);
  }

  static List<Task> sortByTitle(List<Task> tasks, {bool ascending = true}) {
    final sortedTasks = List<Task>.from(tasks);
    sortedTasks.sort((a, b) {
      if (ascending) {
        return a.compareTo(b);
      } else {
        return b.compareTo(a);
      }
    });
    return sortedTasks;
  }
}
