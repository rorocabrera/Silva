import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:silva_admin/models/rol.dart';

import '../environment/environment.dart';

class MainController extends GetxController {
  MainController() {}

  RxInt serverAct = 1.obs;
  List<dynamic> avRoles = [];
  String url = Environment.API_URL;

  void signOut() {
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);
  }

  void getAvRoles() async {
    try {
      http.Response response =
          await http.get(Uri.parse(url + 'api/roles/list'));

      avRoles = jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", e.toString());
    }
  }

  void searchWifi() async {
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      serverAct.value = 2;
      try {
        http.Response response =
            await http.get(Uri.parse(url + 'api/roles/list'));

        serverAct.value = 1;
        timer.cancel();
      } catch (e) {
        serverAct.value = 0;
      }
    });
  }
}
