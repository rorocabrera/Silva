import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:silva_admin/models/response_api.dart';

import '../../../../../environment/environment.dart';
import '../../../../../models/user.dart';
import '../../../../../providers/usersProviders.dart';

class AdminUsersController extends GetxController {
  AdminUsersController() {
    getUsers();
  }

  UsersProvider usersProvider = UsersProvider();

  List<User> users = <User>[].obs;

  void getUsers() async {
    var result = await listPetition();
    users.clear();
    users.addAll(result);
  }

  Future<List<User>> listPetition() async {
    return usersProvider.listAllusers();
  }

  void signOut() {
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);
  }
}
