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
      IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders(
          {'x-access-token': token}).build(),
    );

    // on listen connect
    socket.onConnect((_) {
      log('connected');

      /// TO NAVIGATION SCREEN
      Get.offNamed(Routers.NAV);

      /// connection emit current user
      final currentUser = user.toJson();

      socket.on('get user', (data) {
        // get other users
        if (data != null) {
          data.forEach((user) {
            newUserAdded(Users.fromJson(user));
          });
        }
      });

      // current user connected.
      socket.emit('user connected', currentUser);

      socket.on('user connected', (data) {
        // new user added listen
        final newUser = Users.fromJson(data);
        newUserAdded(newUser);
      });

      socket.on('private message', (data) {
        // listen message
        final message = Messages.fromJson(data);
        log('receive message : ' + message.msg!);
        getMessage(message);
      });

      socket.on('typing', (data) {
        log('message');
        final user = Users.fromJson(data.user);
        final status = data.status;
        userController.setTypingStatus(user, status);
      });
    });
  }

  // add connect user
  void newUserAdded(Users user) {
    userController.addUserConnection(user);
  }

  // send message private
  void sendMessage(Messages message) {
    log('send message : ' + message.msg!);
    socket.emit('private message', message.toJson());
    getMessage(message);
  }

  void getMessage(Messages messages) {
    // listen or send message -> socket.
    messageController.addMessage(messages);
    userController.userMessages(messages);
  }

  void sendTyping(Users to, bool status) {
    // typing send
    socket.emit('typing', {
      'user': to.toJson(),
      'status': status,
    });
  }
}
