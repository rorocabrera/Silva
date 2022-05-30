import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Widgets/MyAppbar/my_app_bar_controller.dart';

PreferredSizeWidget? MyAppBar(String name) {
  MyAppBarController appBarCnt = Get.put(MyAppBarController());

  return AppBar(
    title: Text(name),
    actions: [
      IconButton(
          onPressed: () {
            appBarCnt.signOut();
          },
          icon: Icon(Icons.door_sliding)),
    ],
  );
}
