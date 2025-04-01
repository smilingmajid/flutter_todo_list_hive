import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../core/style/get_date_picker_theme.dart';

class DateBottomController extends GetxController {
  static final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');
  final Rx<String> selectedDate = "Heute".obs;

  final List<Map<String, dynamic>> buttons = [
    {"text": "Heute", "icon": null, "date": DateTime.now()},
    {
      "text": "Morgen",
      "icon": null,
      "date": DateTime.now().add(const Duration(days: 1))
    },
    {"text": null, "icon": Iconsax.calendar_1, "date": null},
  ];



  Future<void> changeDate(int index, BuildContext context) async {
    final button = buttons[index];

    if (button["text"] != null) {
      selectedDate.value = button["text"];
      return;
    }

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) => Theme(
        data: getDatePickerTheme(context),
        child: child!,
      ),
    );

    if (pickedDate != null) {
      selectedDate.value = _dateFormatter.format(pickedDate);
    }
  }
}