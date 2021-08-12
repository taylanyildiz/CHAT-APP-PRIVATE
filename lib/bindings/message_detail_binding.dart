import '/controllers/controllers.dart';
import 'package:get/get.dart';

class MessageDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MessageDetailController());
  }
}
