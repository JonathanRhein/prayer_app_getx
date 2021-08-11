import 'package:prayer_app_getx/models/presentation/language_option.dart';

class Languages {
  static final String defaultLanguage = 'en';
  //List of languages that are supported.  Used in dialog. Please extend when adding
  //new languages
  static final List<LanguageOption> languageOptions = [
    LanguageOption(token: "en", language: "English"), //English
    LanguageOption(token: "ar", language: "عربي"), //Arabic
    LanguageOption(token: "ko", language: "한국어"), //Korean
    LanguageOption(token: "de", language: "Deutsch"), //German
  ];

  static Iterable<MapEntry<int, LanguageOption>> get languages =>
      languageOptions.asMap().entries;
}
