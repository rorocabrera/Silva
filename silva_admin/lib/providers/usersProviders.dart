import 'package:get/get.dart';
import 'package:silva_admin/environment/environment.dart';
import 'package:silva_admin/models/response_api.dart';
import 'dart:convert';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends GetConnect {
  String url = Environment.API_URL + 'api/users';

  Future<http.Response> create(User user) async {
    return http.post(
      Uri.parse('$url/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(user.toJson()),
    );
  }

  Future<ResponseApi> login(String email, String password) async {
    http.Response response = await http.post(
      Uri.parse('$url/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({'email': email, 'password': password}),
    );

    ResponseApi responseApi = ResponseApi.fromJson(json.decode(response.body));
    return responseApi;
  }

  Future<ResponseApi> addRol(String id, String rol) async {
    http.Response response = await http.post(
      Uri.parse('$url/addRol'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({'id': id, 'rol': rol}),
    );

    ResponseApi responseApi = ResponseApi.fromJson(json.decode(response.body));
    return responseApi;
  }

  Future<ResponseApi> deleteRol(String id, String rol) async {
    http.Response response = await http.delete(
      Uri.parse('$url/deleteRol'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({'id': id, 'rol': rol}),
    );

    ResponseApi responseApi = ResponseApi.fromJson(json.decode(response.body));
    return responseApi;
  }

  Future<User> updateUser(String id) async {
    http.Response response = await http.get(Uri.parse('$url/$id'));
    var jsonResponse = json.decode(response.body);
    jsonResponse["roles"] = jsonDecode(jsonResponse["roles"]);
    return User.fromJson(jsonResponse);
  }

  Future<List<User>> listAllusers() async {
    http.Response response = await http.get(Uri.parse('$url/list'));
    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 401 || response.statusCode == 501) {
      Get.snackbar("Petición denegada", "Error en la petición");
      return [];
    }

    List<User> users = User.fromJsonList(jsonResponse);

    return users;
  }
}
