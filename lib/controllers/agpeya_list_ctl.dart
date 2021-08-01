import 'package:get/get.dart';
import 'package:prayer_app_getx/models/databse/agpeya_hour.dart';
import 'package:prayer_app_getx/services/database_srvc.dart';

class AgpeyaListController extends GetxController {
  static AgpeyaListController get find => Get.find();
  List databaseList = <AgpeyaHour>[];
  final DatabaseService _databaseService = DatabaseService();

  @override
  void onInit() async {
    _loadHoursFromDatabase();
    super.onInit();
  }

  _loadHoursFromDatabase() async {
    databaseList = await _databaseService.fetchAgpeyaHours();
    update();
  }
}
