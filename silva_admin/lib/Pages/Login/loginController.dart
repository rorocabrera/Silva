import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void gotoRegisterPage() {
    Get.toNamed("/register");
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    Get.snackbar('email', email);
    Get.snackbar('email', password);
  }
}
