import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomeController cnt = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  cnt.signOut();
                },
                icon: Icon(Icons.door_sliding)),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text("Home Page"),
        ));
  }
}
