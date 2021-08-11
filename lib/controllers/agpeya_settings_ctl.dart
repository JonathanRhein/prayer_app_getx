import 'package:get/get.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/services/database_srvc.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';

class AgpeyaSettingsController extends GetxController {
  static AgpeyaSettingsController get find => Get.find();
  final DatabaseService _databaseService = DatabaseService();

  // TODO: understand in how far language ctl and theme settings srvc can be
  // merged

  bool showOnlyBiblicalTexts;
  bool showMarianTexts;

  @override
  void onInit() async {
    super.onInit();
    await _initializeEnabledVariables();
  }

  _initializeEnabledVariables() async {
    showOnlyBiblicalTexts = showMarianTexts = false;
    await setPrayerEnabledVariables();
  }

  setPrayerEnabledVariables() async {
    showOnlyBiblicalTexts = await _databaseService.checkShowOnlyBiblicalTexts();
    showMarianTexts = await _databaseService.checkShowMarianTexts();
    update();

    // check if the prayers have already been loaded from the database and if
    // so, load them again to display the update hour list view
    try {
      AgpeyaHourController.find.buildPrayerDBListWithHeadings();
    } catch (_) {}
  }

  void togglePrayerEnabledSettings(option) async {
    switch (option) {
      case Strings.ShowOnlyBiblicalTexts:
        showOnlyBiblicalTexts = !showOnlyBiblicalTexts;
        break;
      case Strings.ShowMarianTexts:
        showMarianTexts = !showMarianTexts;
        break;
    }

    await _databaseService.updateDatabaseWithOption(
        option, showOnlyBiblicalTexts, showMarianTexts);

    await setPrayerEnabledVariables();
  }

  void resetTextsToDefault() async {
    await _databaseService.resetTextsToDefault();
    await setPrayerEnabledVariables();
  }

}
