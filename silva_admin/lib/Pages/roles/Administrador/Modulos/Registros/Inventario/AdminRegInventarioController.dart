import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AdminRegInvController extends GetxController {
  void signOut() {
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);
  }
}
