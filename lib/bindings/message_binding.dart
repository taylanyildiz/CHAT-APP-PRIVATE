import '/controllers/controllers.dart';
import 'package:get/get.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MessageListController());
    Get.put(MessageScreenController());
  }
}
