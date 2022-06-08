import 'dart:convert';

final String tableUsers = 'users';
final String tablePerfil = 'perfiles';

class UserDb {
  final String id;
  final String email;
  final String nombre;
  final int level;
  final String password;
  final String roles;
  final String updated_at;

  const UserDb({
    required this.id,
    required this.email,
    required this.nombre,
    required this.level,
    required this.updated_at,
    required this.password,
    required this.roles,
  });

  Map<String, Object?> toJson() => {
        UserField.id: id,
        UserField.email: email,
        UserField.nombre: nombre,
        UserField.level: level,
        UserField.updated_at: updated_at,
        UserField.password: password,
        UserField.roles: roles,
      };
  factory UserDb.fromJsonServer(Map<String, dynamic> json) => UserDb(
        id: json["id"],
        email: json["email"],
        nombre: json["name"],
        level: json["level"],
        password: json["password"],
        updated_at: json["updated_at"],
        roles: jsonEncode(json["roles"]),
      );
  factory UserDb.fromJsonPhone(Map<String, dynamic> json) => UserDb(
        id: json["id"] as String,
        email: json["email"] as String,
        nombre: json["nombre"] as String,
        level: json["level"] as int,
        password: json["password"] as String,
        updated_at: json["updated_at"] as String,
        roles: json["roles"] as String,
      );
}

class UserField {
  static final List<String> values = [
    id,
    level,
    email,
    nombre,
    password,
    roles,
    updated_at,
  ];

  static final List<String> loginQuery = [email, password];

  static final String id = 'id';
  static final String level = 'level';
  static final String email = 'email';
  static final String nombre = 'nombre';
  static final String password = 'password';
  static final String roles = 'roles';
  static final String updated_at = 'updated_at';
}

class PerfilesField {
  static final String cedula = 'cedula';
  static final String email = 'email';
  static final String nombre = 'nombre';
  static final String apellido = 'apellido';
  static final String telefono = 'telefono';
  static final String biometrics = 'biometrics';
  static final String updated_at = 'created_at';
}
