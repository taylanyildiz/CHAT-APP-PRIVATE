import '/controllers/controllers.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingScreenController());
  }
}
