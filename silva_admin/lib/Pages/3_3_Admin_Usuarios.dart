import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/3_4_Admin_UsrEdit.dart';
import 'package:silva_admin/controllers/3_3_Admin_UserCnt.dart';
import 'package:silva_admin/Utils/colors.dart';
import 'package:silva_admin/Widgets/MyAppbar/app_bar.dart';

import '../models/user.dart';

class AdminUsersPage extends StatelessWidget {
  AdminUsersController cnt = Get.put(AdminUsersController());

  @override
  Widget build(BuildContext context) {
    List<User> users = cnt.users;
    return Scaffold(
      appBar: MyAppBar("Módulo de administración de usuarios"),
      body: Obx(() => Center(
            child: _buildUsers(users),
          )),
      floatingActionButton: _infoButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }

  Widget _infoButton() {
    return FloatingActionButton(
        backgroundColor: myRed,
        child: Icon(Icons.info),
        mini: true,
        onPressed: () {
          Get.defaultDialog(content: _info(), title: "Info");
        });
  }

  Widget _info() {
    return Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Nivel",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Text("Modulos",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              _infoRows(),
            ],
          ),
        ));
  }

  Widget _infoRows() {
    String inventario = "assets/images/inventario.png";
    String equipos = "assets/images/equipos.png";
    String obras = "assets/images/obras.png";
    String perfiles = "assets/images/perfiles.png";
    String registros = "assets/images/registros.png";
    double scale = 6;
    double spacing = 150;
    return SingleChildScrollView(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("1"),
            SizedBox(
              width: spacing,
            ),
            Image.asset(
              inventario,
              scale: scale,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("2"),
            SizedBox(
              width: spacing,
            ),
            Image.asset(
              equipos,
              scale: scale,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("3"),
            SizedBox(
              width: spacing,
            ),
            Image.asset(
              perfiles,
              scale: scale,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("4"),
            SizedBox(
              width: spacing,
            ),
            Image.asset(
              registros,
              scale: scale,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("5"),
            SizedBox(
              width: spacing,
            ),
            Image.asset(
              obras,
              scale: scale,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("6"),
            SizedBox(
              width: spacing,
            ),
            Image.asset(
              obras,
              scale: scale,
            ),
            Image.asset(
              registros,
              scale: scale,
            )
          ],
        ),
      ]),
    );
  }

  Widget _buildUsers(List<User> users) {
    ColorsPicker colorPicked = ColorsPicker();

    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return _userCard(colorPicked, user, index);
        });
  }

  Card _userCard(ColorsPicker colorPicked, User user, int index) {
    return Card(
      color: colorPicked.rolesLevelColor(user),
      shadowColor: Colors.white,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ListTile(
          onTap: () {
            Get.to(UserPage(pIndex: index));
          },
          leading: CircleAvatar(
            foregroundColor: Colors.white,
            child: _letterAvatar(user.name ?? ''),
            backgroundColor: colorPicked.rolesColor(user),
          ),
          title: Text(user.email ?? ''),
          subtitle: Text(user.name! + '     id:' + user.id!),
          trailing: _cardTrailing(user),
        ),
      ),
    );
  }

  Widget _addRol(User user, int index) {
    List<String> items = [];
    List<String> roles = User.rolesList(user);

    for (var e in cnt.avRoles) {
      if (!roles.contains(e["name"])) {
        items.add(e["name"]);
      }
    }

    return Flexible(
      child: DropdownButton<String>(
        hint: Text(
          "Agregar Rol",
          style: TextStyle(fontSize: 12),
        ),
        onChanged: ((value) async {
          bool r = await cnt.addRol(user.id, value);
          if (r) {
            cnt.updateUser(index, user.id ?? '');
          }
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
      for (int i = 1; i <= 6; i++) {
        if (i != user.level) {
          numeros.add(i.toString());
        }
      }
    }
    return Flexible(
      child: DropdownButton<String>(
        hint: Text(
          "Cambiar nivel",
          style: TextStyle(fontSize: 12),
        ),
        onChanged: ((value) async {
          bool r = await cnt.changeLevel(user.id, value);
          if (r) {
            cnt.updateUser(index, user.id ?? '');
          }
        }),
        items: numeros.map(buildMenuItem).toList(),
      ),
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
      onChanged: ((value) async {
        bool r = await cnt.deleteRol(user.id, value);
        if (r) {
          cnt.updateUser(index, user.id ?? '');
        }
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
