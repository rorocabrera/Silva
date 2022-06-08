import 'dart:convert';

import 'package:silva_admin/models/rol.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.email,
    this.name,
    this.level,
    this.password,
    this.sessionToken,
    this.roles,
  });

  String? id;
  String? email;
  String? name;
  int? level;
  String? password;
  String? sessionToken;
  List<Rol>? roles = [];

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      email: json["email"],
      name: json["name"],
      level: json["level"],
      password: json["password"],
      sessionToken: json["session_token"],
      roles: json["roles"] == null
          ? []
          : List<Rol>.from(json["roles"].map((model) => Rol.fromJson(model))));

  static List<User> fromJsonList(List<dynamic> jsonList) {
    List<User> toList = [];
    jsonList.forEach((item) {
      item["roles"] = jsonDecode(item["roles"]);
      User user = User.fromJson(item);
      toList.add(user);
    });
    return toList;
  }

  static List<String> rolesList(User user) {
    List<String> roles = [];
    user.roles!.forEach((item) {
      roles.add(item.name ?? '');
    });
    return roles;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "level": level,
        "password": password,
        "session_token": sessionToken,
        "roles": roles
      };
}
