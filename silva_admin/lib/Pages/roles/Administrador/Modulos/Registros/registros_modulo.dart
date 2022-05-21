import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/AdminModulosPageController.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Registros/registros_modulo_controller.dart';

class RegistrosModulosPage extends StatelessWidget {
  RegistrosModuloPageController cnt = Get.put(RegistrosModuloPageController());

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
        body: Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.17),
            child: ListView(
              children: [
                _cardAdmin(1),
                _cardAdmin(2),
                _cardAdmin(3),
              ],
            )));
  }

  Widget _cardAdmin(int index) {
    String _path = '';
    String _name = '';
    switch (index) {
      case 1:
        _path = 'assets/images/inventario.png';
        _name = 'Inventario';
        break;
      case 2:
        _path = 'assets/images/equipos.png';
        _name = 'Equipos';
        break;
      default:
        _path = 'assets/images/perfiles.png';
        _name = 'Perfiles';
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