import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/controllers/3_1_Admin_ObrasCnt.dart';
import 'package:silva_admin/Widgets/MyAppbar/app_bar.dart';

class ObrasListPage extends StatelessWidget {
  ObrasListPageController cnt = Get.put(ObrasListPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Administración de Obras"),
        body: Center(
          child: Text("Página de obras"),
        ));
  }
}
