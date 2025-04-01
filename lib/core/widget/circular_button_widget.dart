import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

Widget circularButtonWidget(VoidCallback onTap, bool isTime, RxBool isShow) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        border: Border.all(
          color: isTime
              ? Colors.grey
              : isShow.value 
                  ? Colors.red
                  : Colors.grey,
          width: 2,
        ),
      ),
      child: Center(
        child: Icon(
          isTime
              ? Ionicons.alarm_outline
              : isShow.value // اینجا مقدار RxBool را درست می‌گیریم
                  ? Icons.close
                  : Icons.add,
          color: isTime
              ? Colors.black
              : isShow.value // اینجا مقدار RxBool را درست می‌گیریم
                  ? Colors.red
                  : Colors.black,
        ),
      ),
    ),
  );
}
