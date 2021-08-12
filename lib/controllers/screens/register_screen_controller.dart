import '/models/users.dart';
import '/services/services.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController {
  /// Name controller
  late TextEditingController nameController;

  /// Phone Controller
  late TextEditingController phoneController;

  /// Password Controller
  late TextEditingController passwordController;

  /// input check
  bool isName = false;
  bool isPassword = false;
  bool isPhone = false;

  /// inputs
  late String name;
  late String phone;
  late String password;

  late Users currentUser;
  late String token;

  /// Restful service
  final restfulService = Get.find<RestfulService>();

  @override
  void onInit() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  void onRegister() async {
    if (!isName || !isPassword || !isPhone) {
      Utils.showSnacBar('Check', 'Check out inputs');
    } else {
      name = nameController.text;
      phone = phoneController.text;
      password = passwordController.text;
      Utils.showLoadinIndicator();
      await restfulService.createAccount(name, phone, password);
    }
    update();
  }

  void onNameCheck(check) => isName = check;

  void onPhoneCheck(check) => isPhone = check;

  void onPasswordCheck(check) => isPassword = check;
}
