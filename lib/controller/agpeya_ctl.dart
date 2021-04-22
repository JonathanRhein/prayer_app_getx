import 'package:get/get.dart';
import 'package:prayer_app_getx/models/databse/agpeya_hour_db.dart';
import 'package:prayer_app_getx/services/db_srvc.dart';

class AgpeyaController extends GetxController {
  static AgpeyaController get to => Get.find();
  final dbList = <AgpeyaHourDatabase>[].obs;
  final DatabaseService _db = DatabaseService();

  // List get hourList => _getAgpeyaHourList();

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

  String capitalize(String s) {
    return _db.capitalize(s);
  }

  dynamic getHourType() {
    
  }

  // List<AgpeyaHour> getAgpeyaHourList(BuildContext context) {
  //   final labels = AppLocalizations.of(context);
  //   List<AgpeyaHour> _hourList;
  //   dbList.forEach((hour) {
  //     Map<String, dynamic> emptyMap = Map();
  //     _hourList.add(AgpeyaHour.fromMap(emptyMap
  //       ..addAll(locator<LanguageService>().getJsonObject(hour.name))
  //       ..addAll(hour.toMap())));
  //     return _hourList;
  //   });
  // }
}
