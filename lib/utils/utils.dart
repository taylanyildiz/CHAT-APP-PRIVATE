import '/dialogs/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

  static fromTimestamp(timesTamp) {
    return DateFormat('MM-dd-yyy hh:mm').format(DateTime.parse(timesTamp));
  }
}
