import 'dart:convert';

Perfil perfilFromJson(String str) => Perfil.fromJson(json.decode(str));

String perfilToJson(Perfil data) => json.encode(data.toJson());

class Perfil {
  Perfil({
    this.cedula,
    this.email,
    this.nombre,
    this.apellido,
    this.telefono,
  });

  String? cedula;
  String? email;
  String? nombre;
  String? apellido;
  String? telefono;

  factory Perfil.fromJson(Map<String, dynamic> json) => Perfil(
        cedula: json["cedula"],
        email: json["email"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "cedula": cedula,
        "email": email,
        "nombre": nombre,
        "apellido": apellido,
        "telefono": telefono,
      };

  static List<Perfil> fromJsonList(List<dynamic> jsonList) {
    List<Perfil> toList = [];
    jsonList.forEach((item) {
      Perfil perfil = Perfil.fromJson(item);
      toList.add(perfil);
    });
    return toList;
  }
}
