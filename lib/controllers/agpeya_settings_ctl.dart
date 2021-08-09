import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';
import 'package:prayer_app_getx/services/database_srvc.dart';
import 'package:prayer_app_getx/utils/constants/agpeya_settings.dart';
import 'package:prayer_app_getx/utils/constants/strings.dart';

class AgpeyaSettingsController extends GetxController {
  static AgpeyaSettingsController get find => Get.find();
  final DatabaseService _databaseService = DatabaseService();

  // TODO: understand in how far language ctl and theme settings srvc can be 
  // merged

  final _sharedPreferences = GetStorage();
  bool showOnlyBiblicalTexts;
  bool showMarianTexts;
  bool showAllPrayers;

  @override
  void onInit() async {
    super.onInit();
    _initializePrayerEnabledVariables();
  }

  _initializePrayerEnabledVariables() {
    showOnlyBiblicalTexts =
        _sharedPreferences.read(Strings.ShowOnlyBiblicalTexts) ??
            AgpeyaSettings.ShowOnlyBiblicalTexts;
    showMarianTexts = _sharedPreferences.read(Strings.ShowMarianTexts) ??
        AgpeyaSettings.ShowMarianTexts;
    showAllPrayers = _sharedPreferences.read(Strings.ShowAllPrayers) ??
        AgpeyaSettings.ShowAllPrayers;
    update();
  }

  void togglePrayerEnabledSettings(option) async {
    if (option == Strings.ShowOnlyBiblicalTexts) {
      showOnlyBiblicalTexts = !showOnlyBiblicalTexts;
      // logically showOnlyBiblicalTexts and showMarianTexts as well as
      // showAllPrayers can not be true at the same time
      if (showOnlyBiblicalTexts) showMarianTexts = showAllPrayers = false;
    } else if (option == Strings.ShowMarianTexts) {
      showMarianTexts = !showMarianTexts;
      // s. comment above
      if (showMarianTexts) showOnlyBiblicalTexts = false;
      if (!showMarianTexts) showAllPrayers = false;
    } else if (option == Strings.ShowAllPrayers) {
      showAllPrayers = !showAllPrayers;
      // s. comment above
      if (showAllPrayers) {
        showOnlyBiblicalTexts = false;
        showMarianTexts = true;
      }
    }

    _sharedPreferences
      ..write(Strings.ShowOnlyBiblicalTexts, showOnlyBiblicalTexts)
      ..write(Strings.ShowMarianTexts, showMarianTexts)
      ..write(Strings.ShowAllPrayers, showAllPrayers);

    update();

    await _databaseService.updateDatabaseWithOption(option,
        showOnlyBiblicalTexts, showMarianTexts, showAllPrayers);

    // check if the prayers have already been loaded from the database and if
    // so, load them again to display the update hour list view
    if (AgpeyaHourController.find != null) {
      AgpeyaHourController.find.buildPrayerDBListWithHeadings();
    }
  }
}
