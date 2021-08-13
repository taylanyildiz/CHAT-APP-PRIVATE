import '/controllers/controllers.dart';
import 'package:get/get.dart';

class MessageScreenController extends GetxController {
  @override
  void onInit() {
    Get.put(MessageListController());
    super.onInit();
  }
}
