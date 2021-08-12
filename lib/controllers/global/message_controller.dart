import 'package:chat_app_ui/controllers/controllers.dart';
import 'package:chat_app_ui/models/model.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  late List<Messages> allMessages = [];

/*
  {
    "12938":
    [
      msg1,
      msg2,
      msg3
    ],
  }
*/

  Map messages = {};

  final userController = Get.find<UserController>();

  void addMessage(Messages messages) {
    allMessages.add(messages);
    update();
  }
}
