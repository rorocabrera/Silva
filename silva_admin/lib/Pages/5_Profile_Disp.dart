import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/6_Profile_BioSignUpWeb.dart'
    if (dart.library.io) 'package:silva_admin/Pages/6_Profile_BioSignUp.dart';
import 'package:silva_admin/controllers/4_3_Admin_PerfCnt.dart';
import 'package:silva_admin/Pages/4_3_Admin_Perfiles.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

AdminRegPerfilesController cnt = Get.put(AdminRegPerfilesController());

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
        margin: EdgeInsets.only(top: Get.height * 0.1, left: 25, right: 25),
        height: Get.height * 0.82,
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
  double hereWidth = 100;
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(8),
              width: hereWidth,
              height: 40,
              child: ElevatedButton(
                  onPressed: () async {
                    var b = await cnt.delete(index);
                    if (b) {
                      Get.off(AdminRegPerfPage());
                    }
                  },
                  child: Text("Eliminar"))),
          !kIsWeb
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(8),
                  width: hereWidth,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(BioSignUp(index));
                      },
                      child: Text("Biometrics")))
              : Container()
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(top: 8),
              width: hereWidth,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Get.off(AdminRegPerfPage());
                  },
                  child: Text("Cancelar"))),
          Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(8),
              width: hereWidth,
              height: 40,
              child: Obx(() => ElevatedButton(
                  onPressed: () async {
                    if (cnt.b.value) {
                      var v = await cnt.updateProfile(index);
                      if (v) {
                        cnt.getPerfiles();
                        Get.to(AdminRegPerfPage());
                      }
                    } else {
                      Get.to(AdminRegPerfPage());
                    }
                  },
                  child: cnt.b.value ? Text("Modificar") : Text("Aceptar")))),
        ],
      ),
    ],
  );
}

Widget _textFieldCedula() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: Expanded(
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
          prefixIcon: SizedBox(
            width: 40,
            child: DropdownButtonFormField<String>(
                value: cnt.cedT,
                elevation: 0,
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
        ),
      ),
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
