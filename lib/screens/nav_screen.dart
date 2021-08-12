import '/controllers/controllers.dart';
import 'package:get/get.dart';
import '/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NavScreen extends GetView<NavScreenController> {
  NavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller.pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.screens.length,
        itemBuilder: (context, index) => controller.screens[index],
      ),
      bottomNavigationBar: CustomBottomNav(
        onPress: controller.onChangePage,
        selectColor: Colors.white,
        color: Colors.grey,
        initialIndex: controller.selectedPage,
        items: [
          CustomBarItem(Icons.call),
          CustomBarItem(Icons.file_copy_outlined),
          CustomBarItem(Icons.add),
          CustomBarItem(Icons.message),
          CustomBarItem(Icons.settings),
        ],
      ),
    );
  }
}
