import '/models/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MessageDetailController extends GetxController {
  // message user
  late Users user;

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
    update();
  }

  void getMessage(Messages msg) {
    if (msg.sender!.phone == user.phone) {
      messages.add(msg);
    }
    update();
  }
}
