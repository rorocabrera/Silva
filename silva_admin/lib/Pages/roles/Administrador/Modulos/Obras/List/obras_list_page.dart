import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Obras/List/obras_list_page_controller.dart';

class ObrasListPage extends StatelessWidget {
  ObrasListPageController cnt = Get.put(ObrasListPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Administración de Obras')),
        body: Center(
          child: Text("Página de obras"),
        ));
  }
}
