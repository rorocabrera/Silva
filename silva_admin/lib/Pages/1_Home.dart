import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Widgets/MyAppbar/my_drawer.dart';
import 'package:silva_admin/controllers/1_HomeCnt.dart';
import 'package:silva_admin/Widgets/MyAppbar/app_bar.dart';
import 'package:silva_admin/models/rol.dart';

class HomePage extends StatelessWidget {
  HomeController cnt = Get.put(HomeController());
  String appBarTxt = "Seleccionar el Módulo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: MyAppBar(appBarTxt),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: Get.height * 0.17),
          child: ListView(
            children: cnt.user.roles != null
                ? cnt.user.roles!.map((Rol rol) {
                    return _cardRol(rol);
                  }).toList()
                : [],
          ),
        ));
  }

  Widget _cardRol(Rol rol) {
    String _path = '';
    switch (rol.id) {
      case "1":
        _path = 'assets/images/administrador.png';
        break;
      case "2":
        _path = 'assets/images/supervisor.png';
        break;
      default:
        _path = 'assets/images/personal.png';
    }

    return GestureDetector(
      onTap: () {
        cnt.goToPageRol(rol);
      },
      child: Column(children: [
        Text(
          rol.name ?? '',
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
