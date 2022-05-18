import 'package:flutter/material.dart';

class AdminRegPerfPage extends StatelessWidget {
  const AdminRegPerfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Administración de Perfiles')),
        body: Center(
          child: Text("Pagina de Perfiles"),
        ));
  }
}
