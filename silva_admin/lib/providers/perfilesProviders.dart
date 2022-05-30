import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:silva_admin/models/perfil.dart';
import '../environment/environment.dart';

class PerfilesProvider extends GetxController {
  String url = Environment.API_URL + 'api/perfiles';

  Future<http.Response> create(Perfil perfil) async {
    return http.post(
      Uri.parse('$url/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(perfil.toJson()),
    );
  }

  Future<List<Perfil>> listAllPerfiles() async {
    http.Response response = await http.get(Uri.parse('$url/list'));
    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 401 || response.statusCode == 501) {
      Get.snackbar("Petición denegada", "Error en la petición");
      return [];
    }

    List<Perfil> perfiles = Perfil.fromJsonList(jsonResponse);

    return perfiles;
  }
}
