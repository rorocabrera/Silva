import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:silva_admin/Pages/home/home_page.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/AdminModulosPage.dart';
import 'package:silva_admin/Pages/roles/Personal/Modulos/personal_modulos_page.dart';
import 'package:silva_admin/Pages/roles/Supervisor/Obras/List/supervisor_obras_list_page.dart';
import 'package:silva_admin/Pages/roles/roles_pages.dart';
import 'package:silva_admin/Utils/colors.dart';
import 'package:silva_admin/models/user.dart';

import 'Pages/Login/login.dart';
import 'Pages/register/register.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {});

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

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
      initialRoute: userSession.id != null ? "/home" : "/",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/register", page: () => RegisterPage()),
        GetPage(name: "/home", page: () => HomePage()),
        GetPage(name: "/roles", page: () => RolesPage()),
        GetPage(name: "/admin/options", page: () => AdminModulosPage()),
        GetPage(
            name: "/superv/options/obras/list",
            page: () => SupervisorObrasListPage()),
        GetPage(name: "/personal/options", page: () => PersonalModulosPage()),
      ],
      navigatorKey: Get.key,
    );
  }
}
