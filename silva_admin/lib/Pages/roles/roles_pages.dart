import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/roles_controller.dart';
import 'package:silva_admin/models/rol.dart';

class RolesPage extends StatelessWidget {
  RolesController cnt = Get.put(RolesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Seleccionar el rol'),
        ),
        body: ListView(
          children: cnt.user.roles != null
              ? cnt.user.roles!.map((Rol rol) {
                  return Text(rol.name ?? '');
                }).toList()
              : [],
        ));
  }

  Widget _cardRol(Rol rol) {
    return Column(children: [
      Container(),
    ]);
  }
}
