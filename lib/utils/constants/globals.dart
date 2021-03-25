import 'package:prayer_app_getx/model/language_options_mdl.dart';

class Globals {
  static final String defaultLanguage = 'en';
  //List of languages that are supported.  Used in dialog. Please extend when adding
  //new languages
  static final List<LanguageOptionsModel> languageOptions = [
    LanguageOptionsModel(token: "en", language: "English"), //English
    LanguageOptionsModel(token: "ar", language: "عربي"), //Arabic
    LanguageOptionsModel(token: "ko", language: "한국어"), //Korean
    LanguageOptionsModel(token: "de", language: "Deutsch"), //German
  ];
}
