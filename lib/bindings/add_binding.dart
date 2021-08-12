import '/controllers/controllers.dart';
import 'package:get/get.dart';

class AddBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddScreenController());
  }
}
