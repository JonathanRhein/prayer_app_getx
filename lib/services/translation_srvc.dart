import 'package:get/get.dart';

// The architecture of this app is built such that each database entry has a key
// that allows to retrieve the corresponding translation for its Strings
// (such as titles, subtitles etc.) from a JSON key-value map in order to
// display them in the UI. The below sevice class helps in creating the
// corresponding keys for the translation map based on the database key

class TranslationService {
  String getTrnsltn(String secondParameter, String property) =>
      ('agpeya.' + secondParameter + '.' + property).tr;

  // String getPrayer(String prayer) => ('agpeya.' + prayer + '.title').tr;
}
