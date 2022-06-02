import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Utils/colors.dart';
import 'package:silva_admin/controllers/3_3_Admin_UserCnt.dart';
import 'package:silva_admin/models/user.dart';

import '../Widgets/MyAppbar/app_bar.dart';
import '../models/rol.dart';

class UserPage extends StatelessWidget {
  final int pIndex;
  UserPage({
    Key? key,
    required this.pIndex,
  }) : super(key: key);

  AdminUsersController cnt = Get.put(AdminUsersController());
  ColorsPicker colorPicked = ColorsPicker();

  @override
  Widget build(BuildContext context) {
    User user = cnt.users[pIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar("Edición de Usuario"),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 40,
                foregroundColor: Colors.white,
                child: _letterAvatar(user.name ?? ''),
                backgroundColor: colorPicked.rolesColor(user),
              ),
            ),
            const SizedBox(height: 20),
            Text(user.name ?? '',
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(user.email ?? '',
                style: const TextStyle(fontSize: 16, color: Colors.black38)),
            const SizedBox(height: 8),
            Flexible(
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: myBlueLight.withOpacity(0.3),
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cnt.avRoles.length,
                    itemBuilder: (context, rIndex) {
                      return _toggleRol(cnt.avRoles, user, rIndex);
                    }),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: myRedLight.withOpacity(0.3),
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(10)),
              child: _securityLevel(user, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _toggleRol(List<dynamic> avRoles, User user, int rIndex) {
    String rolName = avRoles[rIndex]["name"];
    var active = false.obs;
    if (user.roles != null) {
      for (var e in user.roles!) {
        if (e.name == rolName) {
          active.value = true;
        }
      }
    }
    return Obx(() => SwitchListTile(
        value: active.value,
        title: Text(rolName),
        secondary: Icon(Icons.person),
        onChanged: (p0) async {
          if (p0) {
            bool r = await cnt.addRol(user.id, rolName);
            if (r) {
              cnt.updateUser(pIndex, user.id ?? '');
              active.value = p0;
            }
          } else {
            bool r = await cnt.deleteRol(user.id, rolName);
            if (r) {
              cnt.updateUser(pIndex, user.id ?? '');
              active.value = p0;
            }
          }
        }));
  }

  Widget _securityLevel(User user, BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return _changeNivel(user, pIndex, context);
            });
      },
      leading: Icon(Icons.lock),
      title: Text(
        "Nivel de Seguridad",
      ),
      trailing: Text(
        user.level.toString(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _changeNivel(User user, int index, BuildContext context) {
    List<String> numeros = [];
    if (user.level != 0) {
      for (int i = 1; i <= 6; i++) {
        if (i != user.level) {
          numeros.add(i.toString());
        }
      }
    }
    var changed = false.obs;
    String value = user.level.toString();

    return AlertDialog(
      actions: [
        TextButton(
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text("Aceptar"),
          onPressed: () async {
            if (changed.value) {
              bool r = await cnt.changeLevel(user.id, value);
              if (r) {
                cnt.updateUser(index, user.id ?? '');
              }
            }
            Navigator.pop(context);
          },
        )
      ],
      content: DropdownButton<String>(
        isExpanded: true,
        items: numeros.map(buildMenuItem).toList(),
        hint: Text(
          user.level.toString(),
          style: TextStyle(fontSize: 16),
        ),
        onChanged: ((nivel) {
          changed.value = true;
          value = nivel.toString();
        }),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(value: item, child: Text(item));
  }

  Widget _letterAvatar(String name) {
    return Text(
      name[0].toUpperCase(),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }
}
