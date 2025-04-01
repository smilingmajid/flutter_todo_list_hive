import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

Widget emptyWidget(String address, String title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Lottie.asset(
        address,
        width: 400,
        height: 400,
        fit: BoxFit.fill,
      ),
      Text(
        title,
        style: GoogleFonts.oxygenMono(
          textStyle: const TextStyle(
            color: Color.fromARGB(255, 45, 45, 45),
          ),
        ),
      ),
    ],
  );
}
