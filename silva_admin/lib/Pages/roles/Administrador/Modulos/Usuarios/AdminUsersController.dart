import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../../environment/environment.dart';
import '../../../../../models/user.dart';

class AdminUsersController extends GetxController {
  void listPetition() async {
    String url = Environment.API_URL + 'api/users/list';
    print('Se envia peticion de lista de usuarios');
    http.post(Uri.parse(url));
  }
}
