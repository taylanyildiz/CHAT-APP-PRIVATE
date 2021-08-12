import '/controllers/controllers.dart';
import 'package:get/get.dart';

class CameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CameraScreenController());
  }
}
