import 'package:get/get.dart';
import 'package:prayer_app_getx/models/databse/agpeya_hour_db.dart';
import 'package:prayer_app_getx/services/db_srvc.dart';


class AgpeyaController extends GetxController {
  static AgpeyaController get to => Get.find();
  final list = <AgpeyaHourDatabase>[].obs;
  final DatabaseService _db = DatabaseService();

  @override
  void onInit() async {
    await _loadHoursList();
    super.onInit();
  }

  _loadHoursList() async {
    await _db.getAllAgpeyaHours().then((hours) {
      hours.forEach((hour) {
        list.add(AgpeyaHourDatabase.fromMap(hour));
      });
    });
  }
}
