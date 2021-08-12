import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TranslationHelper {
  TranslationHelper._();

  static updateLocalization(Locale locale) => Get.updateLocale(locale);
}
