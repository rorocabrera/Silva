import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Registros/Equipos/AdminRegEquiposController.dart';

class AdminRegEqpPage extends StatelessWidget {
  AdminRegEquiposController cnt = Get.put(AdminRegEquiposController());

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
          title: Text('Módulo de Registros'),
        ),
        body: Center(
          child: Text("Pagina de Equipos"),
        ));
  }
}
