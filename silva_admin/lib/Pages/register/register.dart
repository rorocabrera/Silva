import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Utils/colors.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isApiLoading = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  String? username;
  String? password;
  String? password2;
  String? email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: myBlue,
          body: ProgressHUD(
              child: Form(
                key: globalFormKey,
                child: _registerUI(context),
              ),
              inAsyncCall: isApiLoading,
              opacity: 0.3,
              key: UniqueKey())),
    );
  }

  Widget _registerUI(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [myBlue, mBColor],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * 0.2,
            child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset('assets/images/Silva.png',
                      width: 250, fit: BoxFit.contain),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 30, top: 50),
            child: Text("Registrar",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "Email",
              "ejemplo@email.com",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Campo obligatorio";
                }
                return null;
              },
              (onSavedVal) {
                email = onSavedVal;
              },
              showPrefixIcon: true,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white.withOpacity(0.6),
              borderColor: Colors.white,
              textColor: Colors.white,
              prefixIcon: const Icon(Icons.email),
              hintColor: Colors.white.withOpacity(0.6),
              borderRadius: 10,
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
            "Nombre de usuario",
            "nombre",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Campo obligatorio";
              }
              return null;
            },
            (onSavedVal) {
              username = onSavedVal;
            },
            showPrefixIcon: true,
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white.withOpacity(0.6),
            borderColor: Colors.white,
            textColor: Colors.white,
            prefixIcon: const Icon(Icons.person),
            hintColor: Colors.white.withOpacity(0.6),
            borderRadius: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: FormHelper.inputFieldWidget(context, "password", "Password",
                (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Campo obligatorio";
              }
              return null;
            }, (onSavedVal) {
              password = onSavedVal;
            },
                showPrefixIcon: true,
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white.withOpacity(0.6),
                borderColor: Colors.white,
                textColor: Colors.white,
                prefixIcon: const Icon(Icons.lock),
                hintColor: Colors.white.withOpacity(0.6),
                borderRadius: 10,
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  color: Colors.white.withOpacity(0.7),
                  icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: FormHelper.inputFieldWidget(
              context,
              "password",
              "Confirme su Password",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Campo obligatorio";
                }
                return null;
              },
              (onSavedVal) {
                password2 = onSavedVal;
              },
              showPrefixIcon: true,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white.withOpacity(0.6),
              borderColor: Colors.white,
              textColor: Colors.white,
              prefixIcon: const Icon(Icons.lock),
              hintColor: Colors.white.withOpacity(0.6),
              borderRadius: 10,
              obscureText: hidePassword,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton("Login", () {},
                btnColor: myBlue,
                txtColor: Colors.white,
                borderColor: Colors.white,
                borderRadius: 10),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "O",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          )),
          SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: "Ya está registrado?  "),
                    TextSpan(
                        text: "Login",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed("/");
                          })
                  ]),
            ),
          ),
        ],
      ),
    ));
  }
}
