import 'package:get/get.dart';
import 'package:prayer_app_getx/models/databse/agpeya_hour_db.dart';
import 'package:prayer_app_getx/services/db_srvc.dart';

class AgpeyaListController extends GetxController {
  static AgpeyaListController get to => Get.find();
  final dbList = <AgpeyaHourDatabase>[].obs;
  final DatabaseService _db = DatabaseService();
  String hour;

  @override
  void onInit() async {
    await _loadHoursDBList();
    super.onInit();
  }

  _loadHoursDBList() async {
    await _db.getAllAgpeyaHours().then((hours) {
      hours.forEach((hour) {
        dbList.add(AgpeyaHourDatabase.fromMap(hour));
      });
    });
    
  }

  setHour(int index) => hour = dbList[index].name;
}
