import 'package:bea_dating/core/presentation/utilit/color.dart';
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
    var appBarfont = GoogleFonts.lexend(
    fontSize: 20,fontWeight: FontWeight.w600
  );
   var subHeadline = GoogleFonts.lexend(
    fontSize: 17,
  );
    var userNamefont = GoogleFonts.lexend(
    fontSize: 20,color: const Color.fromARGB(255, 0, 0, 0));
       var matchfont = GoogleFonts.lexend(
    fontSize: 14,color: const Color.fromARGB(255, 0, 0, 0));
      var boostfont= GoogleFonts.lexend(
    fontSize: 17,color: blackclr);

     var userStatus = GoogleFonts.lexend(
    fontSize: 12,color: const Color.fromARGB(255, 0, 0, 0));
  var dateformat = GoogleFonts.lexend(
      fontSize: 14, color: const Color.fromARGB(255, 134, 134, 134));
       var ButtonTextblack = GoogleFonts.aBeeZee(
      color: Colors.black, fontSize: 14);
        flexhead(final color,{double size=20}){
          return GoogleFonts.ubuntu(
      color:color,fontSize: size);
        } 
          flextext(final color,{double size=20,int Fweight=400}){
          return GoogleFonts.ubuntu(
      color:color,fontSize: size,fontWeight:FontWeight.values[(Fweight~/100)-1]);
        } 

}
