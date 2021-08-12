import 'package:chat_app_ui/controllers/controllers.dart';
import 'package:chat_app_ui/models/model.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  late List<Messages> allMessages = [];

  final userController = Get.find<UserController>();

  void addMessage(Messages messages) {
    allMessages.add(messages);
    update();
  }
}
