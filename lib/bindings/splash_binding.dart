import '/services/services.dart';
import '/controllers/controllers.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SecureDbService());
    Get.put(UserController());
    Get.put(MessageController());
    Get.put(SocketService());
    Get.put(RestfulService());
    Get.put(SplashScreenController());
  }
}
