import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Widgets/MyAppbar/main_controller.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);
  MainController mainCnt = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return _myDrawer();
  }

  Widget _myDrawer() {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: [
          _home(),
          Divider(),
          _roles(),
          Divider(),
          _logOut(),
        ],
      ),
    ));
  }

  Widget _roles() {
    return Container();
  }

  Widget _home() {
    return ListTile(
      title: Text("Home"),
      leading: Icon(Icons.home),
      onTap: () {
        Get.toNamed("/home");
      },
    );
  }

  Widget _logOut() {
    return ListTile(
      title: Text("Salir"),
      leading: Icon(Icons.logout),
      onTap: () {
        mainCnt.signOut();
      },
    );
  }
}
