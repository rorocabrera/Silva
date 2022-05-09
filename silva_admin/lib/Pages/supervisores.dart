import 'package:flutter/material.dart';

class Supervisores extends StatelessWidget {
  const Supervisores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text("Supervisores")),
      body: Column(
        children: [
          Text('Pagina de Supervisores'),
        ]
      )
    );
  }
}