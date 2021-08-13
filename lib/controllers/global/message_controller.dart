import '/models/model.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  /// all message from socket
  List<Messages> chatMessages = [];

  void addMessage(Messages messages) {
    chatMessages.add(messages);
    update();
  }
}
