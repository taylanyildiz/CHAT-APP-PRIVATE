import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MessageListController extends GetxController {
  late ScrollController scrollController;
  double opacity = 0;
  double anim = 1.0;
  @override
  void onInit() {
    scrollController = ScrollController()..addListener(() => update());
    super.onInit();
  }

  double getPosition(double height, int index, int totalCount) {
    if (scrollController.hasClients) {
      final itemPositionOffset = totalCount * index;
      final difference = scrollController.offset - itemPositionOffset;
      final percent = 1 - (difference / height);
      anim = percent;
      if (percent > 1.0) anim = 1.0;
      if (percent <= 0.0) anim = 0.0;
    }
    return anim;
  }

  double getOpacity(int totalCount) {
    opacity = getPosition(30.0, 7, totalCount);
    return opacity;
  }
}
