import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Usuarios/User/UserEditPageController.dart';

class UserEditPage extends StatelessWidget {
  UserEditPageController cnt = Get.put(UserEditPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administración de Usuario'),
        actions: [
          IconButton(
              onPressed: () {
                cnt.signOut();
              },
              icon: Icon(Icons.door_sliding)),
        ],
      ),
    );
  }
}
