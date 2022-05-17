import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Supervisor/Obras/List/supervisor_obras_list_controller.dart';

class SupervisorObrasListPage extends StatelessWidget {
  SupervisorObrasListController cnt = Get.put(SupervisorObrasListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Supervisor Obras List Page"),
    ));
  }
}
