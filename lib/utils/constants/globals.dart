import 'package:prayer_app_getx/model/menu_option_model.dart';

class Globals {
  static final String defaultLanguage = 'en';
  //List of languages that are supported.  Used in selector.
  static final List<MenuOptionsModel> languageOptions = [
    MenuOptionsModel(key: "en", value: "English"), //English
    MenuOptionsModel(key: "de", value: "Deutsch"), //German
    MenuOptionsModel(key: "ar", value: "عربي"), //Arabic
    MenuOptionsModel(key: "ko", value: "한국어"), //Korean
  ];
}
