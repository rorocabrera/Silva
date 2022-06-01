import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:silva_admin/environment/environment.dart';
import 'package:silva_admin/models/response_api.dart';
import 'package:silva_admin/models/rol.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../providers/usersProviders.dart';

class AdminUsersController extends GetxController {
  AdminUsersController() {
    getUsers();
    getAvRoles();
  }

  UsersProvider usersProvider = UsersProvider();

  List<User> users = <User>[].obs;
  List<bool> expandedCard = <bool>[].obs;
  List<dynamic> avRoles = [];
  String url = Environment.API_URL;

  void getAvRoles() async {
    http.Response response = await http.get(Uri.parse(url + 'api/roles/list'));

    if (response.statusCode == 201) {
      avRoles = jsonDecode(response.body);
    }
  }

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

  Future<bool> addRol(String? id, String? rol) async {
    bool t = await confirmDialog("Agregar", rol ?? '', id ?? '');
    if (t) {
      for (var e in avRoles) {
        if (e["name"] == rol) {
          rol = e["id"].toString();
        }
      }
      ResponseApi responseApi = await usersProvider.addRol(id ?? '', rol ?? '');
      if (responseApi.success == true) {
        return true;
      }
    }
    return false;
  }

  Future<bool> changeLevel(String? id, String? level) async {
    bool t = await confirmDialog("Cambiar nivel a", level ?? '', id ?? '');
    if (t) {
      print("Queremos cambiar user id $id a nivel $level");
      ResponseApi responseApi =
          await usersProvider.changeLevel(id ?? '', level ?? '');
      if (responseApi.success == true) {
        return true;
      }
    }
    return false;
  }

  Future<bool> deleteRol(String? id, String? rol) async {
    bool t = await confirmDialog("Borrar", rol ?? '', id ?? '');
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

      ResponseApi responseApi =
          await usersProvider.deleteRol(id ?? '', rol ?? '');
      if (responseApi.success == true) {
        return true;
      }
    }
    return false;
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

  Future<bool> confirmDialog(String action, String name, String id) async {
    bool result = false;

    await Get.defaultDialog(
      title: "Confirmar",
      content: _dialogContent(action, name, id),
      barrierDismissible: false,
      onCancel: () {
        result = false;
      },
      onConfirm: () {
        result = true;
        Get.back();
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
