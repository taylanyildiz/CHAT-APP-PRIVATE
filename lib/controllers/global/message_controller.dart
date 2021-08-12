import 'package:chat_app_ui/models/model.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  late List<Messages> allMessages = [];

  void addMessage(Messages messages) {
    allMessages.add(messages);
    update();
  }
}
