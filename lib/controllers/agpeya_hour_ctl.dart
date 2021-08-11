import 'package:get/get.dart';
import 'package:prayer_app_getx/models/presentation/agpeya_prayer.dart';
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
    await buildPrayerDBListWithHeadings();
    super.onInit();
  }

  // creates a list of prayers with headings for each new section
  buildPrayerDBListWithHeadings() async {
    databaseList = await _databaseService.fetchAgpeyaPrayers(hour);

    prayerList.clear();
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
    update();
  }

  void togglePrayerEnabled(prayerListIndex) async {
    AgpeyaPrayer prayer =
        databaseList[_getCorrespondingDbListIndex(prayerListIndex)];
    prayer.isEnabled = prayer.isEnabled == 1 ? 0 : 1;
    await _databaseService.updateAgpeyaPrayer(prayer);
    update();
  }

  // as prayerList contains also section headings this method returns
  // the corresponding index for databaseList in order to be able to update the
  // correct database entry
  int _getCorrespondingDbListIndex(prayerListIndex) {
    return prayerListIndex -
        prayerList.foldIndexed(
            0,
            (index, prev, item) => item is String && index <= prayerListIndex
                ? prev + 1
                : prev + 0);
  }

  bool isPrayerEnabled(prayerListIndex) =>
      databaseList[_getCorrespondingDbListIndex(prayerListIndex)].isEnabled ==
      1;

  // checks if there is at least one prayer "enabled" for the given section.
  // If none is enabled, the section heading shall not be displayed
  bool sectionContainsAnyEnabledPrayers({int prayerListIndex, String section}) {
    var currentSection = section ?? prayerList[prayerListIndex];
    return databaseList
            .where(
                (item) => item.section == currentSection && item.isEnabled == 1)
            .length >
        0;
  }

  // returns the index of the first "visible" item in prayerList in order for
  // the scroll functionality (s. above) to work properly. E.g. if someone
  // disables all prayers of a section, the index of the first visible item is 
  // not "0" but some other value > 1 (e.g. 5), as the corresponding section 
  // heading will not be displayed either
  int indexOfFirstVisibleItem() => prayerList.foldIndexed(
      0,
      (index, prev, item) => (item is String &&
                  !sectionContainsAnyEnabledPrayers(prayerListIndex: index)) ||
              (item is AgpeyaPrayer &&
                  item.isEnabled == 0 &&
                  !sectionContainsAnyEnabledPrayers(section: item.section))
          ? prev + 1
          : prev + 0);
}
