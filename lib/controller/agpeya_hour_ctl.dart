import 'package:get/get.dart';
import 'package:prayer_app_getx/models/databse/agpeya_prayer_db.dart';
import 'package:prayer_app_getx/services/db_srvc.dart';

class AgpeyaHourController extends GetxController {
  static AgpeyaHourController get to => Get.find();
  final dbList = <AgpeyaPrayerDatabase>[];
  final prayerList = <dynamic>[].obs;
  final DatabaseService _db = DatabaseService();
  final hour;
  String prayer;

  AgpeyaHourController(this.hour);

  @override
  void onInit() async {
    await _loadPrayerDBList();
    _buildPrayerDBListWithHeadings();
    super.onInit();
  }

  _loadPrayerDBList() async {
    await _db.getAllAgpeyaHourPrayersForSpecificHour(hour).then((hours) {
      hours.forEach((hour) {
        dbList.add(AgpeyaPrayerDatabase.fromMap(hour));
      });
    });
  }

  // creates a list of prayers with headings for each new section
  _buildPrayerDBListWithHeadings() {
    String oldSection = "";
    dbList.forEach((prayer) {
      String newSection = prayer.section;
      if (oldSection != newSection) {
        prayerList.add(newSection);
        oldSection = newSection;
      } else {
        prayerList.add(prayer);
      }
    });
  }

  // setPrayer(int index) => prayer = dbList[index].name;
}
