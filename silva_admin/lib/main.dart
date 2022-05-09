import 'package:flutter/material.dart';
import 'package:silva_admin/Pages/power.dart';
import 'package:silva_admin/Pages/supervisores.dart';
import 'package:silva_admin/Utils/colors.dart';

import 'Pages/login.dart';
import 'Pages/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nomina',
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: <String, WidgetBuilder>{
          '/': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/power': (context) => const Administradores(),
          '/supervisores': (context) => const Supervisores(),
        });
  }
}
