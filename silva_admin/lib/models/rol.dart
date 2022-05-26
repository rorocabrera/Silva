import 'dart:convert';
import 'dart:io';

import 'package:silva_admin/environment/environment.dart';

Rol rolFromJson(String str) => Rol.fromJson(json.decode(str));

String rolToJson(Rol data) => json.encode(data.toJson());

class Rol {
  Rol({
    this.id,
    this.name,
    this.route,
  });

  String? id;
  String? name;
  String? route;

  factory Rol.fromJson(Map<String, dynamic> json) => Rol(
        id: json["id"],
        name: json["name"],
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "route": route,
      };
}
