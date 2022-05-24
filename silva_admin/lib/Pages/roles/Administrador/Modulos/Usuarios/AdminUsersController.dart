import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../models/user.dart';
import '../../../../../providers/usersProviders.dart';

class AdminUsersController extends GetxController {
  AdminUsersController() {
    getUsers();
  }

  UsersProvider usersProvider = UsersProvider();

  List<User> users = <User>[].obs;
  List<bool> expandedCard = <bool>[].obs;

  void getUsers() async {
    var result = await listPetition();
    users.clear();
    users.addAll(result);
    for (int i = 0; i < users.length; i++) {
      expandedCard.add(false);
    }
  }

  void updateUser(int index, String id) async {
    users[index] = await usersProvider.updateUser(id);
  }

  void addRol(String? id, String? rol) async {
    bool t = confirmDialog("Agregar", rol ?? '', id ?? '');
    if (t) {
      if (rol == "ADMINISTRADOR") {
        rol = "1";
      }
      if (rol == "SUPERVISOR") {
        rol = "2";
      }
      if (rol == "PERSONAL") {
        rol = "3";
      }
      await usersProvider.addRol(id ?? '', rol ?? '');
    }
  }

  void deleteRol(String? id, String? rol) async {
    bool t = confirmDialog("Borrar", rol ?? '', id ?? '');
    if (t) {
      if (rol == "ADMINISTRADOR") {
        rol = "1";
      }
      if (rol == "SUPERVISOR") {
        rol = "2";
      }
      if (rol == "PERSONAL") {
        rol = "3";
      }

      await usersProvider.deleteRol(id ?? '', rol ?? '');
    }
  }

  void expandedCardinit() {
    for (int i = 0; i < users.length; i++) {
      expandedCard[i] = false;
    }
  }

  Future<List<User>> listPetition() async {
    return usersProvider.listAllusers();
  }

  void signOut() {
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);
  }

  bool confirmDialog(String action, String name, String id) {
    bool result = false;

    Get.defaultDialog(
      title: "Confirmar",
      content: _dialogContent(action, name, id),
      barrierDismissible: false,
      onCancel: () {
        result = false;
      },
      onConfirm: () {
        result = true;
        print("se confirmo");
      },
    );

    return result;
  }

  Widget _dialogContent(String action, String name, String id) {
    return Container(
        child: Row(
      children: [
        Text(action),
        Text(name),
        Text("de usuario id: " + id),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    ));
  }
}
