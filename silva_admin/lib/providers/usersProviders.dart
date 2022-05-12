import 'package:get/get.dart';
import 'package:silva_admin/environment/environment.dart';
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

  Future<Response> create1(User user) async {
    Response response = await post('$url/create', user.toJson(), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    return response;
  }
}
