import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/models/databse/agpeya_prayer_db.dart';
import 'package:prayer_app_getx/services/db_srvc.dart';
import 'package:collection/collection.dart';

class AgpeyaHourController extends GetxController {
  static AgpeyaHourController get find => Get.find();
  final dbList = <AgpeyaPrayerDatabase>[];
  final prayerList = <dynamic>[].obs;
  final DatabaseService _db = DatabaseService();
  final hour;

  AgpeyaHourController(this.hour);

  @override
  void onInit() async {
    await _loadPrayerDBList();
    _buildPrayerDBListWithHeadings();
    super.onInit();
  }

  // retrieves the list of prayers for respective hour from database
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

  void togglePrayerEnabled(prayerListIndex) {
    int dbListIndex =
        prayerListIndex - getCorrespondingDbListIndex(prayerListIndex);
    var prayer = dbList[dbListIndex];
    prayer.isEnabled = prayer.isEnabled == 1 ? 0 : 1;
    //_db.updateAgpeyaHourPrayer(agpeyaHourPrayer)
    update();
  }

  // as prayerList contains also section headings this method returns
  // the corresponding index for dbList in order to be able to act on the
  // database later on
  int getCorrespondingDbListIndex(prayerListIndex) {
    return prayerList.foldIndexed(
        0,
        (index, prev, item) =>
            item is String && index <= prayerListIndex ? prev + 1 : prev + 0);
  }

  bool isPrayerEnabled(prayerListIndex) {
    int dbListIndex =
        prayerListIndex - getCorrespondingDbListIndex(prayerListIndex);
    return dbList[dbListIndex].isEnabled == 1;
  }

  void saveChanges() {}
}
