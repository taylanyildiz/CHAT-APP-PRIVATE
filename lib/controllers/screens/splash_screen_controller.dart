import '/routers/routers.dart';
import '/services/services.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  /// Restful
  final restfulService = Get.find<RestfulService>();

  /// Secure Db
  final secureStorage = Get.find<SecureDbService>();

  /// To Login screen
  void onComplete(bool isComplete) {
    // animation complete listen
    if (isComplete) {
      if (secureStorage.currentUser != null) {
        restfulService.checkUserAccount(
          secureStorage.currentUser!.name,
          secureStorage.currentUser!.password,
        );
      } else
        Get.offAndToNamed(Routers.LOGIN);
    }
  }
}
