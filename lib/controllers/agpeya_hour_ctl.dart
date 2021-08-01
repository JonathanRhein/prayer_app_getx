import 'package:get/get.dart';
import 'package:prayer_app_getx/models/databse/agpeya_prayer.dart';
import 'package:prayer_app_getx/services/database_srvc.dart';
import 'package:collection/collection.dart';

class AgpeyaHourController extends GetxController {
  static AgpeyaHourController get find => Get.find();
  var dbList = <AgpeyaPrayer>[];
  final prayerList = <dynamic>[].obs;
  final DatabaseService _db = DatabaseService();
  final hour;

  AgpeyaHourController(this.hour);

  @override
  void onInit() async {
    dbList = await _db.agpeyaPrayers();
    _buildPrayerDBListWithHeadings();
    super.onInit();
  }

  // creates a list of prayers with headings for each new section
  _buildPrayerDBListWithHeadings() {
    String oldSection = "";
    int index = 0;
    while (index < dbList.length) {
      var prayer = dbList[index];
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
    var prayer = dbList[getCorrespondingDbListIndex(prayerListIndex)];
    
    prayer.isEnabled = prayer.isEnabled == 1 ? 0 : 1;
    await _db.updateAgpeyaPrayer(prayer);
    update();
  }

  // as prayerList contains also section headings this method returns
  // the corresponding index for dbList in order to be able to update the
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
      dbList[getCorrespondingDbListIndex(prayerListIndex)].isEnabled == 1;

  void saveChanges() {}
}
