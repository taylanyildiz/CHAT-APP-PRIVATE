import 'dart:developer';

import 'package:chat_app_ui/models/model.dart';

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

  String? getLastMessage(Users user) {
    List<Messages> userMessage = [];
    messageController.allMessages.forEach((element) {
      if (element.sender!.phone == user.phone) {
        log('message');
        userMessage.add(element);
      }
    });
    if (userMessage.isNotEmpty) return userMessage.last.msg;
  }
}
