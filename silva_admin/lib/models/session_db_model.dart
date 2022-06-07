final String tableUsers = 'users';
final String tablePerfil = 'perfiles';

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
  static final String id = 'id';
  static final String level = 'level';
  static final String email = 'email';
  static final String nombre = 'nombre';
  static final String password = 'password';
  static final String roles = 'roles';
  static final String updated_at = 'created_at';
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
