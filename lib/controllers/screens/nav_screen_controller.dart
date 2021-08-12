import 'dart:developer';

import 'package:flutter/material.dart';

import '/screens/screens.dart';
import 'package:get/get.dart';

class NavScreenController extends GetxController {
  /// Screens Page Controller
  late PageController pageController;

  /// selected Page;
  int selectedPage = 2;

  /// Screnns
  final screens = <Widget>[
    CallScreen(),
    FileScreen(),
    AddScreen(),
    MessageScreen(),
    SettingScreen(),
  ];

  @override
  void onInit() {
    log('onInit');
    pageController = PageController(initialPage: selectedPage);
    super.onInit();
  }

  /// Change Page
  void onChangePage(int page) => pageController.jumpToPage(page);
}
