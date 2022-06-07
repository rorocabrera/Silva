import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:silva_admin/controllers/main_controller.dart';
import 'package:sqlite_viewer/sqlite_viewer.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);
  MainController mainCnt = Get.find();
  @override
  Widget build(BuildContext context) {
    return _myDrawer(context); //context only for Dblist debugging
  }

  Widget _myDrawer(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: [
          _home(),
          Divider(),
          _roles(),
          Divider(),
          _logOut(),
          Divider(),
          _databaseViewer(context), //Only for Dev
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

  Widget _databaseViewer(BuildContext context) {
    return ListTile(
      title: Text("Salir"),
      leading: Icon(Icons.data_object),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => DatabaseList()));
      },
    );
  }
}
