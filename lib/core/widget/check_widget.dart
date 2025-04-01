import 'package:flutter/material.dart';

Widget checkWidget(bool isDone, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          border: Border.all(
              color: isDone ? Colors.transparent : Colors.grey, width: 1.5),
          color: isDone ? Colors.black12 : Colors.transparent,
          borderRadius: BorderRadius.circular(100)),
      child: isDone
          ? const Icon(Icons.check, color: Colors.black)
          : const SizedBox(),
    ),
  );
}
