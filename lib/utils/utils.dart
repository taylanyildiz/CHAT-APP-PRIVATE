import '/dialogs/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  Utils._();

  static showSnacBar(String title, String message) => Get.snackbar(
        title,
        message,
        backgroundColor: Colors.white,
      );

  static showLoadinIndicator() => Get.dialog(
        LoadingDialog(),
        barrierDismissible: false,
      );
}
