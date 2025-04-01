import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../controller/task_controller.dart';
import '../core/widget/empty_widget.dart';
import '../core/widget/check_widget.dart';

class TaskListScreen extends StatelessWidget {
  final String title;

  const TaskListScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find<TaskController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          final tasks = taskController.tasks
              .where((task) => task.title == title)
              .toList();

          if (tasks.isEmpty) {
            return emptyWidget('assets/empty.json', "No task");
          }

          final incompleteTasks = tasks.where((task) => !task.isDone).toList();
          final completeTasks = tasks.where((task) => task.isDone).toList();

          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            'تسک‌های انجام نشده',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              incompleteTasks.length.toString(),
                              style: TextStyle(
                                color: Colors.orange[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: incompleteTasks.isEmpty
                          ? Expanded(
                              flex: 1,
                              child:
                                  emptyWidget('assets/empty.json', "No task"))
                          : ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: incompleteTasks.length,
                              itemBuilder: (context, index) {
                                final task = incompleteTasks[index];
                                return Container(
                                  color: Colors.white,
                                  margin: const EdgeInsets.only(bottom: 12),
                                  child: ListTile(
                                    title: Text(
                                      task.description,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    leading: checkWidget(
                                      task.isDone,
                                      () => taskController.toggleTask(task.id),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Iconsax.trash),
                                      onPressed: () {
                                        taskController.deleteTask(task.id);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: const Divider(
                  height: 1,
                  thickness: 1.5,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            'تسک‌های انجام شده',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              completeTasks.length.toString(),
                              style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: completeTasks.isEmpty
                          ? const Center(
                              child: Text('هیچ تسکی انجام نشده'),
                            )
                          : ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: completeTasks.length,
                              itemBuilder: (context, index) {
                                final task = completeTasks[index];
                                return Container(
                                  color: Colors.white,
                                  margin: const EdgeInsets.only(bottom: 12),
                                  child: ListTile(
                                    title: Text(
                                      task.description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey,
                                          ),
                                    ),
                                    leading: checkWidget(
                                      task.isDone,
                                      () => taskController.toggleTask(task.id),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Iconsax.trash),
                                      onPressed: () {
                                        taskController.deleteTask(task.id);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
