import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:silva_admin/db/databse_helper.dart';
import 'package:silva_admin/models/biometric_user.dart';
import 'package:silva_admin/models/perfil.dart';
import 'package:silva_admin/models/response_api.dart';
import 'package:silva_admin/providers/perfilesProviders.dart';
import 'package:http/http.dart' as http;

class AdminRegPerfilesController extends GetxController {
  AdminRegPerfilesController() {
    getPerfiles();
  }

  var isFilled = false.obs;
  PerfilesProvider perfilesProvider = PerfilesProvider();
  List<Perfil> perfiles = <Perfil>[].obs;
  List<BioUser> bioUsers = [];

  void getBioUsers() {}

  var b = false
      .obs; //un bolleano para reconocer cambios en el ProfilePage y permitir la modificación

  Future<bool> getPerfiles() async {
    var result = await listPetition();
    isFilled.value = true;
    perfiles.clear();
    perfiles.addAll(result);
    return true;
  }

  TextEditingController cedulaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  String cedT = "V-";

  void formClear() {
    cedulaController.clear();
    emailController.clear();
    nombreController.clear();
    apellidoController.clear();
    telefonoController.clear();
    b.value = false;
    isFilled.value = false;
  }

  void formFill(int index) {
    String ced = perfiles[index].cedula!;
    cedT = ced.substring(0, 2);
    cedulaController.text = ced.substring(2);
    emailController.text = perfiles[index].email ?? '';
    nombreController.text = perfiles[index].nombre ?? '';
    apellidoController.text = perfiles[index].apellido ?? '';
    telefonoController.text = perfiles[index].telefono ?? '';
  }

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

  Future<bool> delete(int index) async {
    bool t =
        await confirmDialog("Eliminar: ", "  ", perfiles[index].cedula ?? "");
    if (t) {
      http.Response response = await perfilesProvider.delete(perfiles[index]);
      if (response.statusCode == 201) {
        Get.snackbar("Exito", 'Usuario Eliminado Satisfactoriamente');
        getPerfiles();
      }

      print('RESPONSE: ${response.body}');
    }
    return t;
  }

  Future<bool> updateProfile(int index) async {
    String? email = emailController.text.trim();
    String cedula = perfiles[index].cedula ?? '';
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

      bool t = await confirmDialog("Modificar: ", "  ", perfil.cedula ?? "");
      if (t) {
        http.Response response = await perfilesProvider.updatePerfil(perfil);
        if (response.statusCode == 201) {
          Get.snackbar("Exito", 'Usuario Modificado Satisfactoriamente');
          getPerfiles();
          formClear();
        }

        print('RESPONSE: ${response.body}');
      }

      return t;
    }
    return false;
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

    if (cedulaController.text.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar una Cédula');
      return false;
    }

    if (!isNumeric(cedulaController.text)) {
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

  Future<bool> confirmDialog(String action, String name, String id) async {
    bool result = false;

    await Get.defaultDialog(
      title: "Confirmar",
      content: _dialogContent(action, name, id),
      barrierDismissible: false,
      onCancel: () {
        result = false;
      },
      onConfirm: () {
        result = true;
        Get.back();
      },
    );

    return result;
  }

  Widget _dialogContent(String action, String name, String id) {
    return Container(
        child: Row(
      children: [
        Text(action),
        Text(name),
        Text("de usuario id: " + id),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    ));
  }
}
