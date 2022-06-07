final String tableUsers = 'users';
final String tablePerfil = 'perfiles';
final String tableModulos = 'modulos';
final String tableRoles = 'roles';
final String tableUHR = 'user_has_roles';

class UserField {
  static final String id = 'id';
  static final String level = 'level';
  static final String email = 'email';
  static final String nombre = 'nombre';
  static final String password = 'password';
  static final String created_at = 'created_at';
  static final String modified_at = 'modified_at';
}

class PerfilesField {
  static final String cedula = 'cedula';
  static final String email = 'email';
  static final String nombre = 'nombre';
  static final String apellido = 'apellido';
  static final String telefono = 'telefono';
  static final String biometrics = 'biometrics';
  static final String created_at = 'created_at';
  static final String modified_at = 'modified_at';
}

class RolesField {
  static final String id = 'id';
  static final String nombre = 'name';
  static final String created_at = 'created_at';
  static final String modified_at = 'modified_at';
}

class ModulosField {
  static final String id = 'id';
  static final String id_rol = 'id_rol';
  static final String nombre = 'name';
  static final String route = 'route';
  static final String created_at = 'created_at';
  static final String modified_at = 'modified_at';
}

class UHRField {
  static final String id_user = 'id_user';
  static final String id_rol = 'id_rol';
  static final String created_at = 'created_at';
  static final String modified_at = 'modified_at';
}
