import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:silva_admin/Pages/2_1_AdminModulos.dart';
import 'package:silva_admin/Pages/4_2_Admin_Equipos.dart';
import 'package:silva_admin/Pages/4_1_Admin_Inventario.dart';
import 'package:silva_admin/Pages/4_3_Admin_Perfiles.dart';
import 'package:silva_admin/Pages/3_1_Admin_Obras.dart';
import 'package:silva_admin/Pages/2_3_Pers.dart';
import 'package:silva_admin/Pages/3_2_Admin_Reg_Modulos.dart';
import 'package:silva_admin/Pages/3_3_Admin_Usuarios.dart';
import 'package:silva_admin/Pages/1_Roles.dart';
import 'package:silva_admin/Pages/2_2_Superv.dart';
import 'package:silva_admin/locatorWeb.dart'
    if (dart.library.io) 'package:silva_admin/locator.dart';

import 'package:silva_admin/models/user.dart';
import 'Pages/login.dart';
import 'Pages/register.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {});

void main() async {
  await GetStorage.init();
  setupServices();
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
      initialRoute: userSession.id != null ? "/pers/opt" : "/",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/register", page: () => RegisterPage()),
        GetPage(name: "/roles", page: () => RolesPage()),
        GetPage(name: "/admin/opt", page: () => AdminModulosPage()),
        GetPage(name: "/superv/opt", page: () => SupervPage()),
        GetPage(name: "/pers/opt", page: () => PersonalModulosPage()),
        GetPage(name: "/admin/opt/obras_list", page: () => ObrasListPage()),
        GetPage(name: "/admin/Reg/Inv", page: () => AdminRegInvPage()),
        GetPage(name: "/admin/Reg/Eqp", page: () => AdminRegEqpPage()),
        GetPage(name: "/admin/Reg/Perf", page: () => AdminRegPerfPage()),
        GetPage(name: "/admin/Reg/Opt", page: () => RegistrosModulosPage()),
        GetPage(name: "/admin/opt/users", page: () => AdminUsersPage()),
      ],
      navigatorKey: Get.key,
    );
  }
}
