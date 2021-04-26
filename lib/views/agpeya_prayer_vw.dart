import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/controller/agpeya_prayer_ctl.dart';

class AgpeyaPrayerView extends StatelessWidget {
  final ctl = Get.put(AgpeyaPrayerController(Get.arguments));

  @override
  Widget build(context) {
    return Scaffold(
        body: Container(
      child: Center(child: BodyText(Get.arguments)),
    ));
  }
}
