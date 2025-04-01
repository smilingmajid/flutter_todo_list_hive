import 'package:flutter/material.dart';

Widget textFieldWidget(
    TextEditingController controller, String hint, String label) {
  return TextFormField(
    controller: controller,
    // onChanged: (value) => vari = value,

    maxLines: 1,
    //
    style:
        const TextStyle(fontFamily: 'ClashDisplayRegular', color: Colors.black),
    textAlign: TextAlign.left,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      hintStyle: const TextStyle(
          fontFamily: 'ClashDisplayRegular', color: Colors.grey),
      labelStyle: const TextStyle(
          fontFamily: 'ClashDisplayRegular', color: Colors.black),
      hintText: hint,
      labelText: label,
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Colors.black),
        borderRadius: BorderRadius.circular(100),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Colors.black),
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );
}
