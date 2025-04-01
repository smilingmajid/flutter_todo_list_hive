import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/date_bottom_controller.dart';

Widget listViewBottomWidget(BuildContext context, DateBottomController dateBottomController) {
  return Expanded(
    child: SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dateBottomController.buttons.length,
        itemBuilder: (context, index) {
          final button = dateBottomController.buttons[index];
          final String? text = button["text"];
          final IconData? icon = button["icon"];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.5),
            child: Obx(() => text != null
                ? dateButton(text, dateBottomController.selectedDate.value, () {
                    dateBottomController.changeDate(index, context);
                  })
                : dateButtonWithIcon(
                    icon!, dateBottomController.selectedDate.value, () {
                    dateBottomController.changeDate(index, context);
                  })),
          );
        },
      ),
    ),
  );
}

Widget dateButton(String text, String selected, VoidCallback onTap) {
  bool isSelected = selected == text;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 90,
      height: 45,
      decoration: BoxDecoration(
        color: isSelected ? Colors.transparent : Colors.black,
        borderRadius: BorderRadius.circular(45),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily:
                isSelected ? 'ClashDisplayMedium' : 'ClashDisplayRegular',
            fontSize: 15,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget dateButtonWithIcon(IconData icon, String selected, VoidCallback onTap) {
  bool isSelected = selected != "Heute" && selected != "Morgen"; // بررسی انتخاب تاریخ دستی
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 90,
      height: 45,
      decoration: BoxDecoration(
        color: isSelected ? Colors.transparent : Colors.black,
        borderRadius: BorderRadius.circular(45),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(
        child: Icon(
          icon,
          color: isSelected ? Colors.black : Colors.white,
          size: isSelected ? 25 : 22,
        ),
      ),
    ),
  );
}
