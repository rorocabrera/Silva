import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/AdminModulosPageController.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Registros/Inventario/AdminRegInventarioController.dart';
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
