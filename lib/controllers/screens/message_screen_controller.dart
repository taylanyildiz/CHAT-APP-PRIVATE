import '/services/services.dart';

import '/controllers/controllers.dart';
import 'package:get/get.dart';

class MessageScreenController extends GetxController {
  // socket service
  final socketService = Get.find<SocketService>();

  // user controller
  final userController = Get.find<UserController>();

  // message controller
  final messageController = Get.find<MessageController>();
  @override
  void onInit() {
    Get.put(MessageListController());
    super.onInit();
  }
}
