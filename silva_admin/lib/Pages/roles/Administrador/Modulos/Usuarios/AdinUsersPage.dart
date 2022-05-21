import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Usuarios/AdminUsersController.dart';
import 'package:silva_admin/Utils/colors.dart';

import '../../../../../models/user.dart';

class AdminUsersPage extends StatelessWidget {
  AdminUsersController cnt = Get.put(AdminUsersController());

  @override
  Widget build(BuildContext context) {
    List<User> users = cnt.users;
    return Scaffold(
      appBar: AppBar(
        title: Text('Modulo Administración de Usuarios'),
        actions: [
          IconButton(
              onPressed: () {
                cnt.signOut();
              },
              icon: Icon(Icons.door_sliding)),
        ],
      ),
      body: Obx(() => Center(
            child: _buildUsers(users),
          )),
    );
  }

  Widget _buildUsers(List<User> users) {
    ColorsPicker colorPicked = ColorsPicker();
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: colorPicked.rolesLevelColor(
                    user.roles ?? [], user.level ?? 1),
                child: _letterAvatar(user.name ?? ''),
              ),
              title: Text(user.email ?? ''),
              subtitle: Text(user.name ?? ''),
            ),
          );
        });
  }

  Widget _letterAvatar(String name) {
    return Text(name[0].toUpperCase());
  }
}
