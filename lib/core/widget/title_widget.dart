import 'package:flutter/widgets.dart';

Widget titleWidget(String title) {
  return Row(
    children: [
      Text(
        title,
        // ,
        style: const TextStyle(
          fontFamily: 'ClashDisplayBold',
          fontSize: 20,
          color: Color.fromARGB(255, 45, 45, 45),
        ),
      ),
    ],
  );
}
