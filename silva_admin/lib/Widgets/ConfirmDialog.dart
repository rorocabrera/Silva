import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmDialog {
  Future<bool> confirmDialog(String action, String name, String id) async {
    bool result = false;

    await Get.defaultDialog(
      title: "Confirmar",
      content: _dialogContent(action, name, id),
      barrierDismissible: false,
      onCancel: () {
        result = false;
      },
      onConfirm: () {
        result = true;
        Get.back();
      },
    );

    return result;
  }

  Widget _dialogContent(String action, String name, String id) {
    return Container(
        child: Row(
      children: [
        Text(action),
        Text(name),
        Text("de usuario id: " + id),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    ));
  }
}
