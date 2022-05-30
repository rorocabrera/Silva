import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Registros/Equipos/AdminRegEquiposController.dart';
import 'package:silva_admin/Widgets/MyAppbar/app_bar.dart';

class AdminRegEqpPage extends StatelessWidget {
  AdminRegEquiposController cnt = Get.put(AdminRegEquiposController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Equipos"),
        body: Center(
          child: Text("Pagina de Equipos"),
        ));
  }
}
