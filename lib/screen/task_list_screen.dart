import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';
import '../model/task_model.dart';

class TaskListScreen extends StatelessWidget {
  final String title;

  TaskListScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find<TaskController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Obx(() {
        final tasks =
            taskController.tasks.where((task) => task.title == title).toList();

        if (tasks.isEmpty) {
          return const Center(
            child: Text('هیچ تسکی یافت نشد'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(
                  task.description,
                  style: TextStyle(
                    decoration: task.isDone ? TextDecoration.lineThrough : null,
                    color: task.isDone ? Colors.grey : null,
                  ),
                ),
                leading: Checkbox(
                  value: task.isDone,
                  onChanged: (value) {
                    taskController.toggleTask(task.id);
                  },
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    taskController.deleteTask(task.id);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
