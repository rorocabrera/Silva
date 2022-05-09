import 'package:flutter/material.dart';

class Administradores extends StatelessWidget {
  const Administradores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Administradores"), ),
      body: Column(
        children: [
          Text('Pagina de Administradores'),
        ]
      )
    );
  }
}