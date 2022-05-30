import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Registros/Perfiles/AdminRegPerfilesController.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Registros/Perfiles/AdminRegPerfilesPage.dart';

AdminRegPerfilesController cnt = Get.find();

Widget profilePage(int index) {
  cnt.formFill(index);

  return Scaffold(
    body: Container(
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
        height: Get.height * 0.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _textYourInfo(),
              _textFieldCedula(),
              _textFieldEmail(),
              _textFieldName(),
              _textFieldApellido(),
              _textFieldTelefono(),
              _buttonLogic(index),
            ],
          ),
        )),
  );
}

Widget _buttonLogic(int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(20),
          width: 150,
          height: 40,
          child: ElevatedButton(
              onPressed: () {
                Get.off(AdminRegPerfPage());
              },
              child: Text("Cancelar"))),
      Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(20),
          width: 150,
          height: 40,
          child: Obx(() => ElevatedButton(
              onPressed: () {
                if (cnt.b.value) {
                  cnt.updateProfile(index);
                  cnt.getPerfiles();
                }
                cnt.formClear();
                Get.to(AdminRegPerfPage());
              },
              child: cnt.b.value ? Text("Modificar") : Text("Aceptar")))),
    ],
  );
}

Widget _textFieldCedula() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: Row(
      children: [
        Flexible(
          child: DropdownButtonFormField<String>(
              value: cnt.cedT,
              elevation: 0,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: ((value) {
                cnt.cedT = value ?? "V-";
              }),
              items: const [
                DropdownMenuItem(
                  child: Text("V-"),
                  value: "V-",
                ),
                DropdownMenuItem(
                  child: Text("E-"),
                  value: "E-",
                ),
              ]),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            onChanged: (value) {
              cnt.b.value = true;
            },
            controller: cnt.cedulaController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Cédula',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person)),
          ),
        ),
      ],
    ),
  );
}

Widget _textFieldEmail() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: TextField(
      onChanged: (value) {
        cnt.b.value = true;
      },
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
      onChanged: (value) {
        cnt.b.value = true;
      },
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
        onChanged: (value) {
          cnt.b.value = true;
        },
        controller: cnt.apellidoController,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Apellido',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.person),
        )),
  );
  ;
}

Widget _textFieldTelefono() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: TextField(
        onChanged: (value) {
          cnt.b.value = true;
        },
        controller: cnt.telefonoController,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'Telefono',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.phone),
        )),
  );
  ;
}

Widget _textYourInfo() {
  var myBlack;
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 10),
    child: Text(
      "Datos del perfil",
      style: TextStyle(color: myBlack),
    ),
  );
}