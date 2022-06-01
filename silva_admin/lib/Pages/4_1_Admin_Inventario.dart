import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/controllers/2_1_AdminModCnt.dart';
import 'package:silva_admin/controllers/4_1_Admin_InvCnt.dart';
import 'package:silva_admin/Widgets/MyAppbar/app_bar.dart';

class AdminRegInvPage extends StatelessWidget {
  AdminRegInvController cnt = Get.put(AdminRegInvController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Módulo de Inventario"),
        body: Center(
          child: Text("Pagina de Inventario"),
        ));
  }
}
