import '/controllers/controllers.dart';
import '/models/model.dart';
import '/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MessageDetailController extends GetxController {
  // message user
  late Users user;

  // socket service
  final socketService = Get.find<SocketService>();

  // user controller
  final userController = Get.find<UserController>();

  // messages
  late TextEditingController textMsgController;
  late String msg;

  final List<Messages> messages = [];

  @override
  void onInit() {
    textMsgController = TextEditingController();
    user = Get.arguments!;
    super.onInit();
  }

  void sendMessage() {
    msg = textMsgController.text;
    if (msg.isNotEmpty) {
      final message = Messages(
        sender: userController.currentUser,
        receiver: user,
        msg: msg,
        createdAt: DateTime.now().toString(),
      );
      socketService.sendMessage(message);
      messages.add(message);
    }
    update();
  }

  void getMessage(Messages msg) {
    if (msg.sender!.phone == user.phone) {
      messages.add(msg);
    }
    update();
  }
}
