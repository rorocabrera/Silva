import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/AdminModulosPageController.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Registros/Inventario/AdminRegInventarioController.dart';

class AdminRegInvPage extends StatelessWidget {
  AdminRegInvController cnt = Get.put(AdminRegInvController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  cnt.signOut();
                },
                icon: Icon(Icons.door_sliding)),
          ],
          title: Text('Modulo Personal'),
        ),
        body: Center(
          child: Text("Pagina de Inventario"),
        ));
  }
}
