import 'package:flutter/material.dart';

Widget mainBottomWidget(String label) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(60),
      color: Colors.black,
    ),
    child: Center(
      child: Text(
        //'Kreieren',
        label,
        style: const TextStyle(
          letterSpacing: 2,
          fontFamily: 'ClashDisplayBold',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ),
  );
}
