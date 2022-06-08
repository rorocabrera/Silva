import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/controllers/main_controller.dart';

PreferredSizeWidget? MyAppBar(String name) {
  return AppBar(
    actions: [
      Obx(() => _connection()),
    ],
  );
}

Widget _connection() {
  MainController mainCnt = Get.find();
  Icon icon;
  switch (mainCnt.serverAct.value) {
    case 0:
      icon = Icon(Icons.wifi_off);
      break;
    case 1:
      icon = Icon(Icons.wifi);
      break;
    case 2:
      icon = Icon(Icons.wifi_find);

      break;
    default:
      icon = Icon(Icons.wifi_off);
      break;
  }

  return Visibility(child: IconButton(onPressed: () {}, icon: icon));
}
