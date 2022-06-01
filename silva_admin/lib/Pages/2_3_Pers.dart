import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/controllers/2_3_PersCnt.dart';
import 'package:silva_admin/Widgets/MyAppbar/app_bar.dart';

class PersonalModulosPage extends StatelessWidget {
  PersonalModulosPageController cnt = Get.put(PersonalModulosPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Bienvenido"),
        body: Center(child: Text("Personal Modulos Page")));
  }
}