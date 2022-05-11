import 'package:flutter/material.dart';

const mBColor = Color.fromRGBO(20, 20, 20, 1);
const myBlue = Color.fromRGBO(89, 152, 197, 1);
const myBlueLight = Color.fromRGBO(164, 199, 223, 1);
const priColor = Colors.white;
const myRed = Color.fromRGBO(200, 70, 51, 1);
const myRedLight = Color.fromARGB(255, 212, 162, 164);
const myYellow = Color.fromRGBO(255, 255, 199, 1);
const myPurpleLight = Color.fromRGBO(203, 197, 234, 1);
const myPurple = Color.fromRGBO(63, 49, 135, 1);
const myGreen = Color.fromRGBO(145, 182, 144, 1);
const myGreenLight = Color.fromRGBO(194, 215, 193, 1);
const myBlack = Color.fromRGBO(34, 34, 34, 1);

Map<int, Color> color = {
  50: Color.fromRGBO(164, 199, 223, .1),
  100: Color.fromRGBO(164, 199, 223, .2),
  200: Color.fromRGBO(164, 199, 223, .3),
  300: Color.fromRGBO(164, 199, 223, .4),
  400: Color.fromRGBO(164, 199, 223, .5),
  500: Color.fromRGBO(164, 199, 223, .6),
  600: Color.fromRGBO(164, 199, 223, .7),
  700: Color.fromRGBO(164, 199, 223, .8),
  800: Color.fromRGBO(164, 199, 223, .9),
  900: Color.fromRGBO(164, 199, 223, 1),
};

MaterialColor colorCustom = MaterialColor(0xA4C7DF, color);
