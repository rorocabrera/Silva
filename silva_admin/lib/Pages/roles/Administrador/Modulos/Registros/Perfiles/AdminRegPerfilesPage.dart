import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silva_admin/Pages/roles/Administrador/Modulos/Registros/Perfiles/AdminRegPerfilesController.dart';
import 'package:silva_admin/Widgets/MyAppbar/app_bar.dart';
import 'package:silva_admin/models/perfil.dart';

import '../../../../../../Utils/colors.dart';

class AdminRegPerfPage extends StatelessWidget {
  AdminRegPerfilesController cnt = Get.put(AdminRegPerfilesController());

  @override
  Widget build(BuildContext context) {
    List<Perfil> perfiles = cnt.perfiles;
    return Scaffold(
        appBar: MyAppBar("Perfiles"), body: _buildProfiles(perfiles));
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
              child: Obx(() => ExpansionTile(
                    key: UniqueKey(),
                    onExpansionChanged: (isExpanded) {},
                    leading: CircleAvatar(
                      foregroundColor: Colors.white,
                    ),
                    title: Text(perfil.email ?? ''),
                    subtitle: Text(perfil.nombre! + '  ' + perfil.apellido!),
                    trailing: _cardTrailing(perfil),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: Text("Modificar"))
                        ],
                      )
                    ],
                  )),
            ),
          );
        });
  }

  Widget _cardTrailing(Perfil perfil) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("Cedula " + perfil.cedula!),
        Text("Tlefono " + perfil.telefono!),
      ],
    );
  }
}
