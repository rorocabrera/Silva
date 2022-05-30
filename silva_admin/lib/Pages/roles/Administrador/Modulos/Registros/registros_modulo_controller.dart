import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:silva_admin/models/user.dart';

class RegistrosModuloPageController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});
  String route = '';

  void goToPage(int index) {
    switch (index) {
      case 1:
        route = "/admin/Reg/Inv";
        break;
      case 2:
        route = "/admin/Reg/Eqp";
        break;
      case 3:
        route = "/admin/Reg/Perf";
        break;
    }
    Get.offNamed(route);
  }

  void signOut() {
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);
  }
}
