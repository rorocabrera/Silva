import 'package:flutter/material.dart';
import 'package:silva_admin/controllers/4_3_Admin_PerfCnt.dart';
import 'package:silva_admin/db/databse_helper.dart';
import 'package:silva_admin/models/biometric_user.dart';
import 'package:silva_admin/services/camera.service.dart';
import '../../../locator.dart';
import '../../../services/ml_service.dart';
import 'package:get/get.dart';

class AuthActionButton extends StatefulWidget {
  AuthActionButton({
    Key? key,
    required this.onPressed,
    required this.isLogin,
    required this.reload,
    required this.index,
  });
  final Function onPressed;
  final bool isLogin;
  final Function reload;
  final int index;
  @override
  _AuthActionButtonState createState() => _AuthActionButtonState();
}

class _AuthActionButtonState extends State<AuthActionButton> {
  AdminRegPerfilesController cnt = Get.put(AdminRegPerfilesController());

  final MLService _mlService = locator<MLService>();
  BioUser? predictedUser;

  Future _signUp(context) async {
    DatabaseHelper _databaseHelper = DatabaseHelper.instance;
    List predictedData = _mlService.predictedData;
    String cedula = cnt.perfiles[widget.index].cedula ?? '';

    BioUser userToSave = BioUser(
      cedula: cedula,
      modelData: predictedData,
    );

    await _databaseHelper.insert(userToSave);
    this._mlService.setPredictedData(null);
  }

  Future _signIn(context) async {}

  Future<BioUser?> _predictUser() async {
    BioUser? userAndPass = await _mlService.predict();
    return userAndPass;
  }

  Future onTap() async {
    try {
      bool faceDetected = await widget.onPressed();
      if (faceDetected) {
        if (widget.isLogin) {
          var user = await _predictUser();
          if (user != null) {
            this.predictedUser = user;
          }
        }
        await _signUp(context);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[200],
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CAPTURE',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.camera_alt, color: Colors.white)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
