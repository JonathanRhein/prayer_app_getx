import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/controller/agpeya_ctl.dart';
import 'package:prayer_app_getx/localizations.dart';
import 'package:prayer_app_getx/shared_widgets/app_bar_cstm.dart';
import 'package:prayer_app_getx/shared_widgets/body_text.dart';
import 'package:prayer_app_getx/shared_widgets/end_drawer_cstm.dart';

class AgpeyaView extends StatelessWidget {
  final AgpeyaController _agpeyaController = Get.put(AgpeyaController());

  @override
  Widget build(context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
        endDrawer: EndDrawerCustom(),
        body: Stack(
          children: [
            Obx(() => ListView.builder(
                padding: EdgeInsets.only(top: 320),
                itemCount: _agpeyaController.list.length,
                itemBuilder: (context, index) =>
                    _listItemBuilder(context, index, _agpeyaController))),
            AppBarCustom(title: labels.agpeya.title, hasBackButton: true),
          ],
        ));
  }
}

_listItemBuilder(BuildContext context, int index, AgpeyaController controller) {
  return ListTile(
    leading: BodyText(controller.list[index].name),
  );
}
