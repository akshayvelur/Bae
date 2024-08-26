import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  Color? clr;
  var welcome = GoogleFonts.signikaNegative(
      fontSize: 45, color: Colors.white, fontWeight: FontWeight.bold);
  var welcomecondent = GoogleFonts.signika(
      fontSize: 16, color: Color.fromARGB(234, 250, 250, 250));
  var nextbuttonwhite = GoogleFonts.electrolize(
      color: Color.fromARGB(255, 255, 255, 255), fontSize: 18);
  var nextbuttongreen = GoogleFonts.electrolize(
      color: const Color.fromARGB(255, 58, 132, 82), fontSize: 16);
  var rulesheadline = GoogleFonts.ubuntu(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 18,
      fontWeight: FontWeight.bold);
  var rulesubline = GoogleFonts.kalam(
      color: Color.fromARGB(255, 227, 223, 223),
      fontSize: 15,
      fontWeight: FontWeight.w500);
  var commonheadfont = GoogleFonts.lexend(
    fontSize: 25,
  );
  var dateformat = GoogleFonts.lexend(
      fontSize: 14, color: const Color.fromARGB(255, 134, 134, 134));
       var ButtonTextblack = GoogleFonts.aBeeZee(
      color: Colors.black, fontSize: 14);
}
