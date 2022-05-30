import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/AdminModulosPageController.dart';
import 'package:silva_admin/Widgets/MyAppbar/app_bar.dart';

import '../../../../models/rol.dart';

class AdminModulosPage extends StatelessWidget {
  AdminModulosPageController cnt = Get.put(AdminModulosPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar("Modulos Disponibles"),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.17),
            child: ListView(
              children: [
                _cardAdmin(1),
                _cardAdmin(2),
                cnt.user.level == 0 ? _cardAdmin(3) : Container(),
              ],
            )));
  }

  Widget _cardAdmin(int index) {
    String _path = '';
    String _name = '';
    switch (index) {
      case 1:
        _path = 'assets/images/obras.png';
        _name = 'Obras';
        break;
      case 2:
        _path = 'assets/images/registros.png';
        _name = 'Registros';
        break;
      default:
        _path = 'assets/images/usuarios.png';
        _name = 'Usuarios';
    }

    return GestureDetector(
      onTap: () {
        cnt.goToPage(index);
      },
      child: Column(children: [
        Text(
          _name,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 15),
          height: 100,
          child: Image.asset(_path),
        ),
      ]),
    );
  }
}
