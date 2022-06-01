import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/rol.dart';
import '../models/user.dart';

class RolesController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});

  void signOut() {
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);
  }

  void goToPageRol(Rol rol) {
    String route = rol.route ?? '';
    print(
        "este usuario tiene un id de rol ${rol.id} y rol de nivel ${user.level}");

    if (user.level == 1) {
      route = "/admin/Reg/Inv";
    }
    if (user.level == 2) {
      route = "/admin/Reg/Eqp";
    }
    if (user.level == 3) {
      route = "/admin/Reg/Perf";
    }
    if (user.level == 4) {
      route = "/admin/Reg/Opt";
    }
    if (user.level == 5) {
      route = "/admin/opt/obras_list";
    }

    print(route);
    Get.toNamed(route);
  }
}
