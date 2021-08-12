import '/controllers/controllers.dart';
import 'package:get/get.dart';

class CallBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CallScreenController());
  }
}
