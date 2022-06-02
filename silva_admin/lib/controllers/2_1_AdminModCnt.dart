import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:silva_admin/models/user.dart';

class AdminModulosPageController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});
  String route = '';

  void goToPage(int index) {
    switch (index) {
      case 1:
        route = "/admin/opt/obras_list";
        break;
      case 2:
        route = "/admin/Reg/Opt";
        break;
      case 3:
        route = "/admin/opt/users";
        break;
    }
    GetStorage().write('path', route);
    Get.toNamed(route);
  }

  void signOut() {
    GetStorage().remove('user');
    GetStorage().write('path', "/register");
    Get.offNamedUntil('/', (route) => false);
  }
}
