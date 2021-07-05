import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AgpeyaPrayerController extends GetxController {
  static AgpeyaPrayerController get to => Get.find();
  final index;
  final scrollController = ItemScrollController();

  AgpeyaPrayerController(this.index);

  @override
  void onInit() async {
    // automatic scroll-action shall be invoked after UI is fully built for 
    // first time --> SchedulerBinding
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.scrollTo(
                index: index,
                duration: Duration(seconds: 2),
                curve: Curves.easeInOutCubic);
    });
    super.onInit();
  }
}
