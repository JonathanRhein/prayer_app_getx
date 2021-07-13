import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/services/scroll_srvc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AgpeyaPrayerController extends GetxController {
  static AgpeyaPrayerController get find => Get.find();

  final index;
  final showMenus = false.obs;

  final autoScrollController = ItemScrollController();
  final itemPositionListener = ItemPositionsListener.create();
  var scrollDirection = ScrollDirection.forward;
  final _scrollService = ScrollService();

  AgpeyaPrayerController(this.index);

  @override
  void onInit() async {
    super.onInit();

    // automatic scroll-action shall be performed after UI is fully built
    Future.delayed(
        Duration.zero,
        () => autoScrollController.scrollTo(
            index: index,
            duration: Duration(milliseconds: 1500),
            curve: Curves.easeInOutCubic));

    // toggle Menus on scroll action performed by the user
    itemPositionListener.itemPositions.addListener(() {
      var newScrollDirection = _scrollService.determineScrollDirection(
          itemPositionListener.itemPositions.value.first);
      
      if (scrollDirection != newScrollDirection) {
        showMenus.value =
            newScrollDirection == ScrollDirection.forward ? false : true;
        scrollDirection = newScrollDirection;
      }
    });
  }

  void toggleMenus() => showMenus.value = !showMenus.value;

  // TODO: implement bottom menu

}
