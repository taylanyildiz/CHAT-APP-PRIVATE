import '/services/services.dart';
import '/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  /// Name controller
  late TextEditingController nameController;

  /// Phone Controller
  late TextEditingController passwordController;

  /// check input
  bool isName = false;
  bool isPassword = false;

  /// inputs
  late String name;
  late String password;

  /// Restful service
  final restfulService = Get.find<RestfulService>();

  @override
  void onInit() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  void onLogin() async {
    if (!isName || !isPassword) {
      Utils.showSnacBar('Check', 'Inputs check out');
    } else {
      name = nameController.text;
      password = passwordController.text;
      Utils.showLoadinIndicator();
      await restfulService.signAccount(name, password);
    }
  }

  void onNameCheck(check) => isName = check;

  void onPasswordCheck(check) => isPassword = check;
}
