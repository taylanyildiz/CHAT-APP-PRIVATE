import '/widgets/widgets.dart';
import '/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAppIcon(
          animation: true,
          onComplete: controller.onComplete,
        ),
      ),
    );
  }
}
