import '/controllers/controllers.dart';
import 'package:get/get.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavScreenController());
  }
}
