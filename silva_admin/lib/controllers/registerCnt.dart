import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:silva_admin/models/response_api.dart';
import 'package:silva_admin/models/user.dart';
import 'package:silva_admin/providers/usersProviders.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void gotoLoginPage() {
    Get.toNamed("/");
  }

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    if (isValidForm(email, name, password, confirmPassword)) {
      User user = User(
        email: email,
        name: name,
        password: password,
      );

      http.Response response = await usersProvider.create(user);
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 201) {
        ResponseApi resp = await usersProvider.login(email, password);
        if (resp.success == true) {
          GetStorage().write('user', resp.data);
          var roles = resp.toJson()["data"]["roles"];
          if (roles.length == 1) {
            Get.offNamedUntil("/pers/opt", (route) => false);
          } else {
            Get.offNamedUntil('/roles', (route) => false);
          }
        } else {
          Get.snackbar('Login Faliido', resp.message ?? '');
        }
      }

      print('RESPONSE: ${response.body}');
    }
  }

  bool isValidForm(
      String email, String name, String password, String confirmPassword) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el email');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (name.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar tu nombre');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el password');
      return false;
    }

    if (confirmPassword.isEmpty) {
      Get.snackbar('Formulario no valido',
          'Debes ingresar la confirmacion del password');
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar('Formulario no valido', 'los password no coinciden');
      return false;
    }

    return true;
  }
}
