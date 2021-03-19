// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizations.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

// ignore_for_file: camel_case_types

class AppLocalizations {
  AppLocalizations(this.locale) : labels = languages[locale];

  final Locale locale;

  static final Map<Locale, AppLocalizations_Labels> languages = {
    Locale.fromSubtags(languageCode: 'en'): AppLocalizations_Labels(
      app: AppLocalizations_Labels_App(
        title: 'Prayers',
      ),
      agpeya: AppLocalizations_Labels_Agpeya(
        overview: AppLocalizations_Labels_Agpeya_Overview(
          title: 'Agpeya',
        ),
      ),
      settings: AppLocalizations_Labels_Settings(
        title: 'Settings',
        darkMode: 'Dark Mode',
        language: 'Language',
      ),
    ),
    Locale.fromSubtags(languageCode: 'de'): AppLocalizations_Labels(
      app: AppLocalizations_Labels_App(
        title: 'Gebete',
      ),
      agpeya: AppLocalizations_Labels_Agpeya(
        overview: AppLocalizations_Labels_Agpeya_Overview(
          title: 'Agpeya',
        ),
      ),
      settings: AppLocalizations_Labels_Settings(
        title: 'Einstellungen',
        darkMode: 'Dunkelmodus',
        language: 'Sprache',
      ),
    ),
    Locale.fromSubtags(languageCode: 'ar'): AppLocalizations_Labels(
      app: AppLocalizations_Labels_App(
        title: 'صلاة',
      ),
      agpeya: AppLocalizations_Labels_Agpeya(
        overview: AppLocalizations_Labels_Agpeya_Overview(
          title: 'Agpeya',
        ),
      ),
      settings: AppLocalizations_Labels_Settings(
        title: 'إعدادات',
        darkMode: 'الوضع الظلام',
        language: 'لغة',
      ),
    ),
    Locale.fromSubtags(languageCode: 'ko'): AppLocalizations_Labels(
      app: AppLocalizations_Labels_App(
        title: '기도',
      ),
      agpeya: AppLocalizations_Labels_Agpeya(
        overview: AppLocalizations_Labels_Agpeya_Overview(
          title: 'Agpeya',
        ),
      ),
      settings: AppLocalizations_Labels_Settings(
        title: '설정',
        darkMode: '다크 모드',
        language: '언어',
      ),
    ),
  };

  final AppLocalizations_Labels labels;

  static AppLocalizations_Labels of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)?.labels;
}

class AppLocalizations_Labels_App {
  const AppLocalizations_Labels_App({this.title});

  final String title;

  String getByKey(String key) {
    switch (key) {
      case 'title':
        return title;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_Agpeya_Overview {
  const AppLocalizations_Labels_Agpeya_Overview({this.title});

  final String title;

  String getByKey(String key) {
    switch (key) {
      case 'title':
        return title;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_Agpeya {
  const AppLocalizations_Labels_Agpeya({this.overview});

  final AppLocalizations_Labels_Agpeya_Overview overview;

  String getByKey(String key) {
    switch (key) {
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels_Settings {
  const AppLocalizations_Labels_Settings(
      {this.title, this.darkMode, this.language});

  final String title;

  final String darkMode;

  final String language;

  String getByKey(String key) {
    switch (key) {
      case 'title':
        return title;
      case 'darkMode':
        return darkMode;
      case 'language':
        return language;
      default:
        return '';
    }
  }
}

class AppLocalizations_Labels {
  const AppLocalizations_Labels({this.app, this.agpeya, this.settings});

  final AppLocalizations_Labels_App app;

  final AppLocalizations_Labels_Agpeya agpeya;

  final AppLocalizations_Labels_Settings settings;

  String getByKey(String key) {
    switch (key) {
      default:
        return '';
    }
  }
}
