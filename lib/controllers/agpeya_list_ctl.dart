import 'package:get/get.dart';
import 'package:prayer_app_getx/models/databse/agpeya_hour.dart';
import 'package:prayer_app_getx/services/database_srvc.dart';

class AgpeyaListController extends GetxController {
  static AgpeyaListController get find => Get.find();
  List dbList = <AgpeyaHour>[];
  final DatabaseService _db = DatabaseService();

  @override
  void onInit() async {
    _loadHoursFromDatabase();
    super.onInit();
  }

  _loadHoursFromDatabase() async {
    dbList = await _db.fetchAgpeyaHours();
    update();
  }
}
