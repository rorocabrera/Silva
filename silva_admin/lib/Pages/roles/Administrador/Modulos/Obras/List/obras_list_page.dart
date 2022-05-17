import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Obras/List/obras_list_page_controller.dart';

class ObrasListPage extends StatelessWidget {
  ObrasListPageController cnt = Get.put(ObrasListPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Obras List Page"),
    ));
  }
}
