import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class GeneralScrollController extends GetxController {
  final scrollController = ScrollController();
  ScrollDirection scrollDirection;

  @override
  void onInit() async {
    scrollController.addListener(
        () => scrollDirection = scrollController.position.userScrollDirection);
    super.onInit();
  }
}
