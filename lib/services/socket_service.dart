import 'dart:developer';
import '/controllers/controllers.dart';
import '/models/model.dart';
import '/constants/constants.dart';
import '/routers/routers.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService extends GetxService {
  /// socket
  late IO.Socket socket;

  /// User controller
  final userController = Get.find<UserController>();

  /// Message Controller
  final messageController = Get.find<MessageController>();

  @override
  void onInit() {
    super.onInit();
  }

  void connectSocket(token, user) {
    socket = IO.io(
      SocketContant.BASE,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setExtraHeaders({'x-access-token': token})
          .build(),
    );
    // connect socket
    socket.connect();

    // on listen connect
    socket.onConnect((_) {
      log('connected');

      /// TO NAVIGATION SCREEN
      Get.offNamed(Routers.NAV);

      /// connection emit current user
      final currentUser = user.toJson();

      // get other users
      socket.on('getUser', (data) {
        if (data != null) {
          data.forEach((user) {
            newUserAdded(Users.fromJson(user));
          });
        }
      });

      // current user connected.
      socket.emit('userConnect', currentUser);

      socket.on('newUserConnected', (data) {
        // new user added listen
        final newUser = Users.fromJson(data);
        newUserAdded(newUser);
      });

      socket.on('message', (data) {
        // sender - receiver - msg - isRead - createAt
        listenMessage(data);
      });
    });
  }

  void newUserAdded(Users user) {
    // add connect user
    userController.addUserConnection(user);
  }

  // send message
  void sendMessage(Messages message) {
    socket.emit('message', message.toJson());
  }

  void listenMessage(data) {
    final message = Messages.fromJson(data);

    messageController.addMessage(message);
    if (Get.isRegistered<MessageDetailController>()) {
      Get.find<MessageDetailController>().getMessage(message);
    }
  }
}
