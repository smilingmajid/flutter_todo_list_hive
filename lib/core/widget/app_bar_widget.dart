import 'package:flutter/material.dart';

Widget appBarWidget(String title, BuildContext context) {
  return Row(
    children: [
      InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(500)),
            child: const Icon(Icons.close)),
      ),
      const Spacer(),
      Text(
        title,
        //'Neue Aufgabe',
        style: const TextStyle(
          fontFamily: 'ClashDisplayBold',
          fontSize: 20,
          color: Color.fromARGB(255, 45, 45, 45),
        ),
      ),
      const Spacer(),
    ],
  );
}
