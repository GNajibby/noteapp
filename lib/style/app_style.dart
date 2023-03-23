import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgtColor = Color.fromARGB(214, 60, 60, 73);
  static Color mainColor = Color.fromARGB(218, 36, 36, 138);
  static Color accentColor = Color.fromARGB(179, 227, 227, 243);

  static List<Color> cardcolor = [
    Color.fromARGB(225, 30, 30, 165),
    Color.fromARGB(224, 165, 73, 30),
    Color.fromARGB(224, 30, 165, 86),
    Color.fromARGB(224, 165, 30, 104),
    Color.fromARGB(224, 165, 30, 104),
  ];

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.bold);
  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 16.0, fontWeight: FontWeight.normal);
  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 13.0, fontWeight: FontWeight.w500);
}
