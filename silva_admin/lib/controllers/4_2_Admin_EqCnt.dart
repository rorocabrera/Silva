import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AdminRegEquiposController extends GetxController {
  void signOut() {
    GetStorage().remove('user');
    GetStorage().write('path', '/');
    Get.offNamedUntil('/', (route) => false);
  }
}
