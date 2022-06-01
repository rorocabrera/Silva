import 'dart:convert';

class BioUser {
  String cedula;
  List modelData;

  BioUser({
    required this.cedula,
    required this.modelData,
  });

  static BioUser fromMap(Map<String, dynamic> user) {
    return new BioUser(
      cedula: user['cedula'],
      modelData: jsonDecode(user['model_data']),
    );
  }

  toMap() {
    return {
      'cedula': cedula,
      'model_data': jsonEncode(modelData),
    };
  }
}
