import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/components/body_text.dart';
import 'package:prayer_app_getx/components/link_text.dart';
import 'package:prayer_app_getx/components/list_section_heading.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/controllers/agpeya_list_ctl.dart';
import 'package:prayer_app_getx/controllers/end_drawer_cstm_ctl.dart';
import 'package:prayer_app_getx/services/translation_srvc.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';
import 'package:prayer_app_getx/utils/constants/styles.dart';
import 'package:prayer_app_getx/views/agpeya_hour_vw.dart';

class EndDrawerCustom extends StatelessWidget {
  final controller = Get.put(EndDrawerCustomController());
  final agpeyaListController = AgpeyaListController.find;
  final translationService = TranslationService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
              color: context.theme.accentColor,
            ),
            child: SizedBox()),
        _getHeadingTile(
          'settings.general'.tr,
        ),
        _getLinkTile('settings.title'.tr, Icons.settings_outlined,
            Strings.SettingsRoute),
        _getHeadingTile('agpeya.title'.tr),
        _getLinkTile('agpeya.information'.tr, null, Strings.AgpeyaInformation),
        ...List.generate(agpeyaListController.databaseList.length,
            (index) => _getAgpeyaHours(index)),
        SizedBox(
          height: Styles.ButtonSpacing,
        )
      ],
    ));
  }

  Widget _getHeadingTile(title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 40),
      child: ListSectionHeading(
        title,
        padding: true,
        scaleFactor: 1.5,
      ),
    );
  }

  Widget _getAgpeyaHours(index) {
    String hour = agpeyaListController.databaseList[index].name;
    return ListTile(
      contentPadding: EdgeInsets.only(
          left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
      onTap: () => _navigateToAgpeyaHour(hour),
      leading: translationService.getTranslation(hour, 'latinNumber') == ""
          ? SizedBox()
          : LinkText(
              translationService.getTranslation(hour, 'latinNumber'),
              fontFamily: Strings.Vidaloka,
            ),
      title: BodyText(translationService.getTranslation(hour, 'title')),
      trailing: Icon(
        Icons.navigate_next,
        color: Get.context.theme.accentColor,
      ),
      minLeadingWidth: 10,
    );
  }

  _navigateToAgpeyaHour(String hour) {
    // This weird implementation which uses either Get.toNamed or Get.to is due
    // to existing problems of the GetX library with nested navigation which 
    // at the time of development had not been taken care of and will hopefully 
    // be resolved in a future update of the package. Routing only works if the 
    // routing method changes every time. Otherwise the AgpeyaHourController is 
    // not disposed correctly and the view build anew. 
    // (s. https://github.com/jonataslaw/getx/issues/1813)
    Get.back();
    Get.delete<AgpeyaHourController>();
    controller.lastRoutingUsedToNamed
        ? Get.toNamed(Strings.AgpeyaHourRoute, arguments: hour)
        : Get.to(() => AgpeyaHourView(), arguments: hour);
    controller.lastRoutingUsedToNamed = !controller.lastRoutingUsedToNamed;
  }

  Widget _getLinkTile(title, icon, route) {
    return ListTile(
        contentPadding: EdgeInsets.only(
            left: Styles.ScreenLeftPadding, right: Styles.ScreenRightPadding),
        title: Row(
          children: [
            if (icon == null)
              ...[]
            else ...[
              Icon(icon),
              SizedBox(
                width: Styles.ButtonSpacing,
              ),
            ],
            Text(
              title,
              textAlign: TextAlign.end,
            ),
          ],
        ),
        trailing: Icon(
          Icons.navigate_next,
          color: Get.context.theme.accentColor,
        ),
        onTap: () => {navigator.pop, Get.toNamed(route)});
  }
}
