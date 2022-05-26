import 'package:flutter/material.dart';
import 'package:silva_admin/models/rol.dart';
import 'package:silva_admin/models/user.dart';

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
  Color rolesLevelColor(User user) {
    int level = user.level!;
    if (level == 0) {
      level = 10;
    }
    int nRoles = user.roles!.length;
    return Color.fromARGB(
        level * 8 * nRoles, level * 20, level * 20, level * 25);
  }

  Color rolesColor(User user) {
    double op = 0.7;
    if (user.roles!.length == 1) {
      return myGreenLight;
    } else if (user.roles!.length == 2) {
      for (var e in user.roles!) {
        if (e.name == "SUPERVISOR") {
          return Colors.amberAccent.withOpacity(op);
        }
      }
    } else if (user.roles!.length == 3) {
      op = 1;
    }
    return Colors.blueGrey.withOpacity(op);
  }
}
