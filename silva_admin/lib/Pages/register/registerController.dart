import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      Get.snackbar(
          'Formulario valido', 'Estas listo para enviar la peticion Http');

      User user = User(
        email: email,
        name: name,
        password: password,
      );

      http.Response response = await usersProvider.create(user);

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
