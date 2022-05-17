import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Personal/Modulos/personal_modulos_page_controller.dart';

class PersonalModulosPage extends StatelessWidget {
  PersonalModulosPageController cnt = Get.put(PersonalModulosPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Text("Personal Modulos Page")));
  }
}
