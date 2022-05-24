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
            color: colorPicked.rolesLevelColor(user),
            shadowColor: Colors.white,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Obx(() => ExpansionTile(
                    key: UniqueKey(),
                    initiallyExpanded: cnt.expandedCard[index],
                    onExpansionChanged: (isExpanded) {
                      bool x = cnt.expandedCard[index];
                      cnt.expandedCardinit();
                      cnt.expandedCard[index] = !x;
                    },
                    leading: CircleAvatar(
                      child: _letterAvatar(user.name ?? ''),
                    ),
                    title: Text(user.email ?? ''),
                    subtitle: Text(user.name! + '     id:' + user.id!),
                    trailing: _cardTrailing(user),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _addRol(user, index),
                          _changeNivel(user, index),
                          _eliminarRol(user, index)
                        ],
                      )
                    ],
                  )),
            ),
          );
        });
  }

  Widget _addRol(User user, int index) {
    List<String> items = [];
    List<String> roles = User.rolesList(user);

    if (!roles.contains("ADMINISTRADOR")) {
      items.add("ADMINISTRADOR");
    }

    if (!roles.contains("SUPERVISOR")) {
      items.add("SUPERVISOR");
    }

    return Flexible(
      child: DropdownButton<String>(
        hint: Text(
          "Agregar Rol",
          style: TextStyle(fontSize: 12),
        ),
        onChanged: ((value) {
          print(value);
          cnt.addRol(user.id, value);
          cnt.updateUser(index, user.id ?? '');
        }),
        items: items.map(buildMenuItem).toList(),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(value: item, child: Text(item));
  }

  Widget _changeNivel(User user, int index) {
    List<String> numeros = [];
    if (user.level != 0) {
      for (int i = 1; i <= 9; i++) {
        if (i != user.level) {
          numeros.add(i.toString());
        }
      }
    }
    return DropdownButton<String>(
      hint: Text(
        "Cambiar nivel",
        style: TextStyle(fontSize: 12),
      ),
      onChanged: ((value) {}),
      items: numeros.map(buildMenuItem).toList(),
    );
  }

  Widget _eliminarRol(User user, int index) {
    List<String> roles = [];
    if (user.level != 0) {
      roles = User.rolesList(user);
    }
    return DropdownButton<String>(
      hint: Text(
        "Eliminar Rol",
        style: TextStyle(fontSize: 12),
      ),
      onChanged: ((value) {
        cnt.deleteRol(user.id, value);
        cnt.updateUser(index, user.id ?? '');
        cnt.expandedCard[index] = false;
      }),
      items: roles.map(buildMenuItem).toList(),
    );
  }

  Widget _letterAvatar(String name) {
    return Text(name[0].toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.bold));
  }

  Widget _cardTrailing(User user) {
    String roles = "";
    int r = user.roles!.length;
    for (int i = 0; i < r; i++) {
      if (i > 0) {
        roles += "/";
      }

      roles += user.roles![i].name.toString().substring(0, 3);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("Nivel: " + user.level.toString()),
        Text(roles),
      ],
    );
  }
}
