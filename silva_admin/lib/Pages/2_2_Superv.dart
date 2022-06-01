import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/controllers/2_2_SupervCnt.dart';
import 'package:silva_admin/Widgets/MyAppbar/app_bar.dart';

class SupervPage extends StatelessWidget {
  SupervController cnt = Get.put(SupervController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Bienvenido"),
        body: Center(
          child: Text("Pagina Supervisor"),
        ));
  }
}
