import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/Login/loginController.dart';
import 'package:silva_admin/Utils/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController cnt = Get.put(LoginController());
  bool c = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _textDontHaveAccout(),
        body: Stack(
          children: [
            _backgroundCover(),
            SingleChildScrollView(
              child: Column(
                children: [
                  _imageCover(),
                  _textApp(),
                  _boxFore(context),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _backgroundCover() {
    return Container(
      width: double.infinity,
      height: Get.height * 0.4,
      color: Colors.blueGrey,
    );
  }

  Widget _textApp() {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          "Sistema Integral de Localización y Validación Administrativa",
          style: TextStyle(fontWeight: FontWeight.bold, color: myBlack),
        ));
  }

  Widget _boxFore(BuildContext context) {
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
        height: Get.height * 0.45,
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogic(),
          ],
        ));
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

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
          controller: cnt.passwordController,
          obscureText: c,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: c ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  c = !c;
                });
              },
            ),
          )),
    );
    ;
  }

  Widget _textYourInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      child: Text(
        "Ingrese esta información",
        style: TextStyle(color: myBlack),
      ),
    );
  }

  Widget _buttonLogic() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
          onPressed: () {
            cnt.login();
          },
          child: Text(
            'Login',
            style: TextStyle(color: myBlack, fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget _textDontHaveAccout() {
    return Container(
      height: Get.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No estás registrado?',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(width: 7),
          GestureDetector(
            onTap: () {
              cnt.gotoRegisterPage();
            },
            child: Text(
              'Registrate Aquí',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _imageCover() {
    return SafeArea(
      child: Container(
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/Silva.png',
            width: 300,
          )),
    );
  }
}
