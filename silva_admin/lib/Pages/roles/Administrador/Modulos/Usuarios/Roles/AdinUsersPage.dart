import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Usuarios/AdminUsersController.dart';

class AdminUsersPage extends StatelessWidget {
  AdminUsersController cnt = Get.put(AdminUsersController());

  @override
  Widget build(BuildContext context) {
    cnt.listPetition();
    return Scaffold(
      appBar: AppBar(title: Text('Modulo Administración de Usuarios')),
      body: Center(
        child: Text("Página Anministración de Usuarios"),
      ),
    );
  }
}
