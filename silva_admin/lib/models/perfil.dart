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
    this.biometrics,
  });

  String? cedula;
  String? email;
  String? nombre;
  String? apellido;
  String? telefono;
  String? biometrics;

  factory Perfil.fromJson(Map<String, dynamic> json) => Perfil(
      cedula: json["cedula"],
      email: json["email"],
      nombre: json["nombre"],
      apellido: json["apellido"],
      telefono: json["telefono"],
      biometrics: json["biometrics"]);

  Map<String, dynamic> toJson() => {
        "cedula": cedula,
        "email": email,
        "nombre": nombre,
        "apellido": apellido,
        "telefono": telefono,
        "biometrics": biometrics,
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
