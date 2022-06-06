import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/db/databse_helper.dart';
import 'package:silva_admin/models/biometric_user.dart';

class DisplayData extends StatelessWidget {
  List<BioUser>? model_data;

  DisplayData() {
    fetchData();
  }

  fetchData() async {
    model_data = await _databaseHelper.queryAllUsers();
    print(model_data![0].modelData.toString().length);
    print(model_data![0].modelData.toString());
    if (model_data != null) {
      d.value = true;
    }
  }

  DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  RxBool d = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
        child: d.value
            ? SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    child: Text(
                      model_data![0].modelData.toString(),
                      style: TextStyle(fontSize: 8),
                    )))
            : CircularProgressIndicator()));
  }
}
