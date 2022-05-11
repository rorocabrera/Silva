import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void gotoLoginPage() {
    Get.toNamed("/");
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
  }
}
