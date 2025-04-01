import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflit_learn/controller/time_controller.dart';
import '../controller/date_bottom_controller.dart';
import '../controller/date_controller.dart';
import '../controller/task_controller.dart';
import '../controller/title_controller.dart';
import '../core/widget/app_bar_widget.dart';
import '../core/widget/circular_button_widget.dart';
import '../core/widget/list_view_bottom_widget.dart';
import '../core/widget/main_bottom_widget.dart';
import '../core/widget/text_field_widget.dart';
import '../core/widget/title_widget.dart';
import '../model/task_model.dart';

class AddNewTaskScreen extends StatelessWidget {
  AddNewTaskScreen({super.key});
  final timeController = Get.find<TimeController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DateBottomController dateBottomController =
        Get.put(DateBottomController());
    final TitleController showTitleController = Get.put(TitleController());
    final TaskController taskController = Get.find<TaskController>();
    final DateController dateController = Get.find<DateController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Spacer(),
            appBarWidget('Neue Aufgabe', context),
            const Spacer(),
            titleWidget("Datum und Zeit"),
            const SizedBox(height: 10),
            Row(
              children: [
                circularButtonWidget(() => timeController.selectTime(context),
                    true, showTitleController.isShow),
                listViewBottomWidget(context, dateBottomController),
              ],
            ),
            const Spacer(),
            titleWidget("Projekte"),
            const SizedBox(height: 10),
            Row(
              children: [
                Obx(() => circularButtonWidget(
                      () => showTitleController.changeShowStatus(),
                      false,
                      showTitleController.isShow,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            const Spacer(),
            textFieldWidget(titleController, "Titel", "Aufgabe Titel"),
            const SizedBox(height: 10),
            textFieldWidget(descriptionController, "Optional", "Beschreibung"),
            const SizedBox(height: 10),
            GetBuilder<TitleController>(
              builder: (_) => showTitleController.isShow.value
                  ? Row(
                      children: [
                        Expanded(
                          child: textFieldWidget(
                              categoryController, "New Projekt", "Projekt"),
                        ),
                      ],
                    )
                  : const SizedBox(height: 50),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                String title = titleController.text;
                String description = descriptionController.text;
                String category = categoryController.text;

                if (title.isNotEmpty && category.isNotEmpty) {
                  var newTask = Task(
                    title: title,
                    category: category,
                    dueDate: dateController.dueDate,
                    description: description,
                  );
                  taskController.addTask(newTask);

                  Get.back();
                } else {
                  Get.snackbar(
                      "Fehler", "Titel und Kategorie dürfen nicht leer sein!");
                }
              },
              child: mainBottomWidget("Kreieren"),
            ),
          ],
        ),
      ),
    );
  }
}
