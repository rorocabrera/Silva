import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:silva_admin/models/perfil.dart';
import 'package:silva_admin/models/response_api.dart';
import 'package:silva_admin/providers/perfilesProviders.dart';
import 'package:http/http.dart' as http;

class AdminRegPerfilesController extends GetxController {
  AdminRegPerfilesController() {
    getPerfiles();
  }

  PerfilesProvider perfilesProvider = PerfilesProvider();
  List<Perfil> perfiles = <Perfil>[].obs;

  void getPerfiles() async {
    var result = await listPetition();
    perfiles.clear();
    perfiles.addAll(result);
  }

  TextEditingController cedulaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  String cedT = "V-";

  void register() async {
    String? email = emailController.text.trim();
    String cedula = cedT + cedulaController.text;
    String nombre = nombreController.text.trim();
    String apellido = apellidoController.text.trim();
    String telefono = telefonoController.text.trim();

    if (isValidForm(email, cedula, nombre, apellido, telefono)) {
      Perfil perfil = Perfil(
        email: email,
        cedula: cedula,
        nombre: nombre,
        apellido: apellido,
        telefono: telefono,
      );

      http.Response response = await perfilesProvider.create(perfil);
      var jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 201) {
        Get.snackbar("Exito", 'Usuario Registrado Satisfactoriamente');
        getPerfiles();
      }

      print('RESPONSE: ${response.body}');
    }
  }

  void delete(int index) async {
    http.Response response = await perfilesProvider.delete(perfiles[index]);
    if (response.statusCode == 201) {
      Get.snackbar("Exito", 'Usuario Eliminado Satisfactoriamente');
      getPerfiles();
    }

    print('RESPONSE: ${response.body}');
  }

  bool isValidForm(String email, String cedula, String nombre, String apellido,
      String telefono) {
    if (!email.isEmpty) {
      if (!GetUtils.isEmail(email)) {
        Get.snackbar('Formulario no valido', 'El email no es valido');
        return false;
      }
    }

    if (nombre.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar un Nombre');
      return false;
    }

    if (cedula.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar una Cédula');
      return false;
    }

    if (!isNumeric(cedula)) {
      Get.snackbar('Formulario no valido', 'Formato de Cedula incorrecto');
      return false;
    }

    if (apellido.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el apellido');
      return false;
    }

    if (telefono.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar el telefonod');
      return false;
    }

    if (!GetUtils.isPhoneNumber(telefono)) {
      Get.snackbar('Formulario no valido', 'El telefono no es valido');
      return false;
    }

    return true;
  }

  Future<List<Perfil>> listPetition() async {
    return perfilesProvider.listAllPerfiles();
  }

  bool isNumeric(String s) {
    return int.tryParse(s) != null;
  }
}
