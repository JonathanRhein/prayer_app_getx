import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AgpeyaPrayerController extends GetxController {
  static AgpeyaPrayerController get find => Get.find();
  final index;
  final scrollController = ItemScrollController();
  final showMenu = false.obs;

  AgpeyaPrayerController(this.index);

  @override
  void onInit() async {
    super.onInit();
    // automatic scroll-action shall be invoked after UI is fully built for
    // first time
    Future.delayed(Duration.zero, () => scrollController.scrollTo(
          index: index,
          duration: Duration(milliseconds: 1500),
          curve: Curves.easeInOut));
    
  }

  void toggleMenus() => showMenu.value = !showMenu.value;

  // TODO: add scroll listening for disappearence of menus
  // implement bottom menu
}
