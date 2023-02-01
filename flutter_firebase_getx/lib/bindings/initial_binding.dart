import 'package:flutter_firebase_getx/config/themes/theme_controller.dart';
import 'package:flutter_firebase_getx/controllers/auth_controller.dart';
import 'package:get/get.dart';

// initialbinding is injected
class IniitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true); //permanent-stay in memory
    // TODO: implement dependencies
  }
}
