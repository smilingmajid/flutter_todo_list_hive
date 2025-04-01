import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/style/get_time_picker_theme.dart';

class TimeController extends GetxController {
  final Rx<String> selectedTime = "".obs;

  Future<void> selectTime(BuildContext context) async {
    try {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.input,
        builder: (context, child) => Theme(
          data: getTimePickerTheme(context),
          child: child!,
        ),
      );

      if (pickedTime != null) {
        
        // ignore: use_build_context_synchronously
        selectedTime.value = pickedTime.format(context);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to select time',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
