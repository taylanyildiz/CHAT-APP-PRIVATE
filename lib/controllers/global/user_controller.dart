import '/services/services.dart';
import '/models/model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  /// User user
  late Users currentUser;

  /// Connect user
  List<Users> other = [];

  /// Token
  late String token;

  /// Secure Local Database
  final secureStorage = Get.find<SecureDbService>();

  /// UPDATE USER & TOKEN
  void updateUserToken(Users user, String token) async {
    secureStorage.updateCurrentUser(user);
    this.currentUser = user;
    this.token = token;
    update();
  }

  void updateToken(String token) {
    this.token = token;
    update();
  }

  /// conversetion user
  void addUserConnection(Users user) {
    if (user != currentUser) {
      int index = other.indexWhere((element) => element.phone == user.phone);
      if (index == -1) {
        // user added new
        other.add(user);
      } else {
        // user  online || offline
        other[index] = user;
      }
    }
    update();
  }

  void userMessages(Messages message) {
    other.forEach((element) {
      if (element.phone == message.receiver!.phone ||
          element.phone == message.sender!.phone) {
        element.messages.add(message);
      }
      update();
    });
  }

  bool getMeIs(int userIndex, int messageIndex) {
    if (other[userIndex].messages[messageIndex].sender!.phone ==
        currentUser.phone) {
      return true;
    } else {
      return false;
    }
  }

  bool lastIsMe(int userIndex) {
    if (other[userIndex].messages.isNotEmpty) {
      int lastIndex = other[userIndex].messages.length;
      if (other[userIndex].messages[lastIndex - 1].sender!.phone ==
          currentUser.phone) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void setTypingStatus(Users user, bool status) {
    // typing change
    int index = other.indexWhere((element) => user.phone == element.phone);
    if (index != -1) {
      other[index].isTyping = status;
    }
    update();
  }
}
