import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/controller/agpeya_text_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';

class AgpeyaTextView extends StatelessWidget {
  final controller = Get.put(AgpeyaTextController(Get.arguments));
  final translationService = TranslationService();

  @override
  Widget build(context) {
    return Scaffold(body: Container());
  }
}
