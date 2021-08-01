import 'package:get/get.dart';
import 'package:prayer_app_getx/models/databse/agpeya_prayer.dart';
import 'package:prayer_app_getx/services/database_srvc.dart';
import 'package:collection/collection.dart';

class AgpeyaHourController extends GetxController {
  static AgpeyaHourController get find => Get.find();
  List databaseList = <AgpeyaPrayer>[];
  final prayerList = <dynamic>[];
  final DatabaseService _databaseService = DatabaseService();
  final hour;

  AgpeyaHourController(this.hour);

  @override
  void onInit() async {
    await _loadPrayersFromDatabase();
    _buildPrayerDBListWithHeadings();
    super.onInit();
  }

  _loadPrayersFromDatabase() async {
    databaseList = await _databaseService.fetchAgpeyaPrayers(hour);
    update();
  }

  // creates a list of prayers with headings for each new section
  _buildPrayerDBListWithHeadings() {
    String oldSection = "";
    int index = 0;
    while (index < databaseList.length) {
      AgpeyaPrayer prayer = databaseList[index];
      String newSection = prayer.section;
      if (oldSection != newSection) {
        prayerList.add(newSection);
        oldSection = newSection;
      } else {
        prayerList.add(prayer);
        index++;
      }
    }
  }

  void togglePrayerEnabled(prayerListIndex) async {
    AgpeyaPrayer prayer =
        databaseList[getCorrespondingDbListIndex(prayerListIndex)];
    prayer.isEnabled = prayer.isEnabled == 1 ? 0 : 1;
    await _databaseService.updateAgpeyaPrayer(prayer);
    update();
  }

  // as prayerList contains also section headings this method returns
  // the corresponding index for databaseList in order to be able to update the
  // correct database entry
  int getCorrespondingDbListIndex(prayerListIndex) {
    return prayerListIndex -
        prayerList.foldIndexed(
            0,
            (index, prev, item) => item is String && index <= prayerListIndex
                ? prev + 1
                : prev + 0);
  }

  bool isPrayerEnabled(prayerListIndex) =>
      databaseList[getCorrespondingDbListIndex(prayerListIndex)].isEnabled == 1;


  // checks to see if there is at least one prayer "enabled" for the given 
  // section. If none is enabled, the section heading won't be displayed at all
  bool sectionContainsAnyEnabledPrayers(prayerListIndex) =>
      databaseList
          .where((item) =>
              item.section == prayerList[prayerListIndex] &&
              item.isEnabled == 1)
          .length >
      0;
}
