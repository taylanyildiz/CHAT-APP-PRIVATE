import 'dart:developer';

import '/controllers/controllers.dart';
import '/services/services.dart';
import '/models/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MessageDetailController extends GetxController {
  // message user
  late Users user;

  /// user index
  late int userIndex;

  // messages
  late TextEditingController textMsgController;
  late String msg;

  final List<Messages> messages = [];

  final socketService = Get.find<SocketService>();
  final userConroller = Get.find<UserController>();

  @override
  void onInit() {
    textMsgController = TextEditingController();
    user = Get.arguments['user'];
    userIndex = Get.arguments['userIndex'];
    log(userIndex.toString());
    super.onInit();
  }

  void sendMessage() {
    msg = textMsgController.text;
    if (msg.isNotEmpty) {
      final message = Messages(
        sender: userConroller.currentUser,
        receiver: user,
        msg: msg,
        createdAt: DateTime.now().toString(),
        isRead: false,
      );
      socketService.sendMessage(message);
    }
    update();
  }
}
