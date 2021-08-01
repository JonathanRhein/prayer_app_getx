import 'package:get/get.dart';
import 'package:prayer_app_getx/models/databse/agpeya_hour.dart';
import 'package:prayer_app_getx/services/database_srvc.dart';

class AgpeyaListController extends GetxController {
  static AgpeyaListController get find => Get.find();
  List dbList = <AgpeyaHour>[].obs;
  final DatabaseService _db = DatabaseService();

  @override
  void onInit() async {
    super.onInit();
    dbList = await _db.agpeyaHours();
  }
}
