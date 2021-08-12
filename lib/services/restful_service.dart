import 'package:chat_app_ui/controllers/controllers.dart';
import 'package:chat_app_ui/routers/routers.dart';
import '/constants/constants.dart';
import '/services/services.dart';
import '/utils/utils.dart';
import '/models/model.dart';
import 'package:get/get.dart';

class RestfulService extends GetConnect {
  /// User controller
  final userController = Get.find<UserController>();

  /// Secure Storage
  final secureStorage = Get.find<SecureDbService>();

  @override
  void onInit() {
    baseUrl = RestfulConstant.BASE_URL;
    super.onInit();
  }

  /// Create Account
  Future createAccount(name, phone, password) async {
    var url = RestfulConstant.CREATE_ACCOUNT;
    Response response = await post(url, {
      "name": name,
      "phone": phone,
      "password": password,
    });
    if (response.statusCode == 200) {
      if (response.body['user'] != null && response.body['token'] != null) {
        final user = Users.fromJson(response.body['user'][0]);
        final token = response.body['token'];
        socketConnection(token, user);
      } else {
        secureStorage.removeCurrentUser();
      }
    } else if (response.statusCode == 400) {
      Get.back();
      secureStorage.removeCurrentUser();
      Utils.showSnacBar('Dont Create Account', response.body['message']);
    } else {
      secureStorage.removeCurrentUser();
    }
  }

  /// Login
  Future signAccount(name, password) async {
    var url = RestfulConstant.LOGIN;
    Response response = await post(url, {
      "name": name,
      "password": password,
    });
    if (response.statusCode == 200) {
      Users user = Users.fromJson(response.body['user'][0]);
      final token = response.body['token'];
      socketConnection(token, user);
    } else if (response.statusCode == 400) {
      Get.back();
      secureStorage.removeCurrentUser();
      Utils.showSnacBar('User Name', response.body['message']);
    } else if (response.statusCode == 401) {
      secureStorage.removeCurrentUser();
      Get.back();
      Utils.showSnacBar('User Password', response.body['message']);
    } else {
      Get.back();
      secureStorage.removeCurrentUser();
      Utils.showSnacBar('Internet Connection', 'Connection Error');
    }
  }

  /// Check account
  Future checkUserAccount(name, password) async {
    final url = RestfulConstant.CHECK_ACCOUNT;
    Response response = await post(url, {"name": name, "password": password});
    if (response.statusCode == 200) {
      Users user = Users.fromJson(response.body['user'][0]);
      final token = response.body['token'];
      socketConnection(token, user);
    } else if (response.statusCode == 400) {
      Get.back();
      secureStorage.removeCurrentUser();
      Utils.showSnacBar('Account Error', 'User Not Found');
      Get.toNamed(Routers.LOGIN);
    } else if (response.statusCode == 401) {
      // null name & password
      Get.back();
      secureStorage.removeCurrentUser();
      Utils.showSnacBar('Account Error', 'Empty User ');
      Get.toNamed(Routers.LOGIN);
    } else {
      secureStorage.removeCurrentUser();
    }
  }

  /// Refresh Token Cretate
  Future takeRefreshToken() async {
    if (secureStorage.currentUser != null) {
      final user = secureStorage.currentUser!;
      final url = RestfulConstant.REFRESH_TOKEN;
      Response response = await post(url, {"name": user.name});
      if (response.statusCode == 200) {
        final token = response.body['token'];
        socketConnection(token, user);
      }
    }
  }

  void socketConnection(String token, Users user) {
    userController.updateUserToken(user, token);
    Get.find<SocketService>().connectSocket(token, user);
  }
}
