import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:silva_admin/Pages/register.dart';
import 'package:silva_admin/controllers/main_controller.dart';
import 'package:silva_admin/db/session_database.dart';
import 'package:silva_admin/models/response_api.dart';
import 'package:silva_admin/providers/usersProviders.dart';
import 'package:sqflite/sqlite_api.dart';

import '../models/user.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();
  MainController mainCnt = Get.find();

  void gotoRegisterPage() async {
    GetStorage().write('path', "/register");
    Get.to(RegisterPage());
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    if (isValidForm(email, password)) {
      try {
        ResponseApi responseApi = await usersProvider.login(email, password);

        print('Response Api:  ${responseApi.toJson()}');

        if (responseApi.success == true) {
          GetStorage().write('user', responseApi.data);
          User user = User.fromJson(responseApi.data);
          _addOfflineUser(user);
          var roles = responseApi.toJson()["data"]["roles"];
          print(roles);
          if (roles.length == 1) {
            GetStorage().write('path', "/pers/opt");
            Get.offNamedUntil("/pers/opt", (route) => false);
          } else {
            GetStorage().write('path', "/home");
            Get.offNamedUntil('/home', (route) => false);
          }
        } else {
          Get.snackbar('Login Faliido', responseApi.message ?? '');
        }
      } on SocketException {
        mainCnt.serverAct.value = false;
        _offlineLogin();
      }
    }
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el email');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el password');
      return false;
    }

    return true;
  }

  _offlineLogin() {}

  _addOfflineUser(User data) async {
    print("we are in _addoflineUser");
    _syncOfflineUserDb();
    bool t = await SessionDatabase.instance.insertUser(data);
    print(t);
  }

  _syncOfflineUserDb() {}
}
