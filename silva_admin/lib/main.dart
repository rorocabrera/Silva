import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/power.dart';
import 'package:silva_admin/Pages/supervisores.dart';
import 'package:silva_admin/Utils/colors.dart';

import 'Pages/Login/login.dart';
import 'Pages/register/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nomina',
      initialRoute: "/",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/register", page: () => RegisterPage()),
      ],
      navigatorKey: Get.key,
    );
  }
}
