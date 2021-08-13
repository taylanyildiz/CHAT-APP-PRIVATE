import 'dart:developer';

import 'package:chat_app_ui/controllers/controllers.dart';
import 'package:chat_app_ui/models/model.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  late List<Messages> allMessages = [];

  /// user controller.
  final userController = Get.find<UserController>();

  final List chats = [];

  void addMessage(Messages messages) {
    allMessages.add(messages);
    log('message');
    update();
  }
}
