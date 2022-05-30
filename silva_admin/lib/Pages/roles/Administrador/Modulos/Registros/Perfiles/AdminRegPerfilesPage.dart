import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Registros/Perfiles/AdminRegPerfilesController.dart';
import 'package:silva_admin/Widgets/MyAppbar/app_bar.dart';

import '../../../../../../Utils/colors.dart';

class AdminRegPerfPage extends StatelessWidget {
  AdminRegPerfilesController cnt = Get.put(AdminRegPerfilesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar("Perfiles"), body: _profileForm(context));
  }

  Widget _profileForm(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15,
                  offset: Offset(0, 0.75)),
            ]),
        margin: EdgeInsets.only(top: Get.height * 0.1, left: 50, right: 50),
        height: Get.height * 0.60,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _textYourInfo(),
              _textFieldCedula(),
              _textFieldEmail(),
              _textFieldName(),
              _textFieldApellido(),
              _textFieldTelefono(),
            ],
          ),
        ));
  }

  Widget _textFieldCedula() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: cnt.cedulaController,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Cédula',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: cnt.emailController,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Correo electrónico',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: cnt.nombreController,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Nombre ',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget _textFieldApellido() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
          controller: cnt.apellidoController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
          )),
    );
    ;
  }

  Widget _textFieldTelefono() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
          controller: cnt.telefonoController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Telefono',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
          )),
    );
    ;
  }

  Widget _textYourInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        "Ingrese sus datos",
        style: TextStyle(color: myBlack),
      ),
    );
  }
}
