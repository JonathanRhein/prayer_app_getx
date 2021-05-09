import 'package:get/get.dart';
import 'package:prayer_app_getx/models/databse/agpeya_prayer_db.dart';
import 'package:prayer_app_getx/services/db_srvc.dart';

class AgpeyaPrayerController extends GetxController {
  static AgpeyaPrayerController get to => Get.find();
  final dbList = <AgpeyaPrayerDatabase>[].obs;
  final DatabaseService _db = DatabaseService();
  final String hour;
  String prayer;

  AgpeyaPrayerController(this.hour);

  @override
  void onInit() async {
    await _loadPrayersDBList();
    super.onInit();
  }

  _loadPrayersDBList() async {
    await _db.getAllAgpeyaHourPrayersForSpecificHour(hour).then((hours) {
      hours.forEach((hour) {
        dbList.add(AgpeyaPrayerDatabase.fromMap(hour));
      });
    });
  }

  setPrayer(int index) => prayer = dbList[index].name;
}
