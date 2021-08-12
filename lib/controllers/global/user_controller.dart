import '/services/services.dart';
import '/models/model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  /// User user
  late Users currentUser;

  /// Contact user
  List<Users> other = [];

  /// Token
  late String token;

  /// Secure Local Database
  final secureStorage = Get.find<SecureDbService>();

  @override
  void onInit() {
    super.onInit();
  }

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
}
