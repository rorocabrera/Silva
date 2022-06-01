import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/5_Profile_New.dart';
import 'package:silva_admin/Pages/5_Profile_Disp.dart';
import 'package:silva_admin/controllers/4_3_Admin_PerfCnt.dart';
import 'package:silva_admin/Widgets/MyAppbar/app_bar.dart';
import 'package:silva_admin/models/perfil.dart';

import '../Utils/colors.dart';
import '5_Profile_New.dart';

class AdminRegPerfPage extends StatelessWidget {
  AdminRegPerfilesController cnt = Get.put(AdminRegPerfilesController());

  @override
  Widget build(BuildContext context) {
    List<Perfil> perfiles = cnt.perfiles;

    return Scaffold(
        appBar: MyAppBar("Perfiles"),
        body: cnt.isFilled.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Obx(() => _buildProfiles(perfiles)),
        floatingActionButton: FloatingActionButton(
            onPressed: (() {
              cnt.formClear();
              Get.offAll(profileForm());
            }),
            child: Icon(Icons.add)));
  }

  Widget _buildProfiles(List<Perfil> perfiles) {
    ColorsPicker colorPicked = ColorsPicker();

    return ListView.builder(
        itemCount: perfiles.length,
        itemBuilder: (context, index) {
          final perfil = perfiles[index];
          return Card(
            shadowColor: Colors.white,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ListTile(
                onTap: (() {
                  print("Tap on profile");
                  Get.to(profilePage(index));
                }),
                key: UniqueKey(),
                leading: CircleAvatar(
                  foregroundColor: Colors.white,
                ),
                title: Text(perfil.nombre! + '  ' + perfil.apellido!),
                subtitle: Text(perfil.email ?? ''),
                trailing: _cardTrailing(perfil),
              ),
            ),
          );
        });
  }

  Widget _cardTrailing(Perfil perfil) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("C.I. " + perfil.cedula!),
        Text("Tel. " + perfil.telefono!),
      ],
    );
  }
}
