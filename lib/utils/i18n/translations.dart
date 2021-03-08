import 'package:get/get.dart';
import 'package:prayer_app_getx/utils/i18n/de_DE.dart';
import 'package:prayer_app_getx/utils/i18n/en_US.dart';

class PATranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnUSTranslations.translations,
        'de_DE': DeDETranslations.translations
      };
}
