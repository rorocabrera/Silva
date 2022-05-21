import 'package:flutter/material.dart';
import 'package:silva_admin/models/rol.dart';

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

class ColorsPicker {
  Color color = myGreen;

  Color rolesLevelColor(List<Rol> roles, int level) {
    for (var e in roles) {
      if (e.id == "1") {
        color = myPurple;
        break;
      }
      if (e.id == "2") {
        color = myYellow;
        break;
      }
    }
    return color;
  }
}
