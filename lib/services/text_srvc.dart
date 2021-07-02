import 'dart:ui';
import 'package:html/parser.dart';

class TextService {
  String getTextPreview(String prayerText) {
    String _previewText = "";
    String _partText = "";
    prayerText = _parseHtmlString(prayerText);
    int numberOfWords = ' '.allMatches(prayerText).length;
    int previewNumberOfWords = 5;
    if (numberOfWords < previewNumberOfWords) {
      previewNumberOfWords = numberOfWords;
    }
    int i = 0;
    while (i < previewNumberOfWords) {
      if (prayerText != null) {
        _partText = prayerText.split(" ")[i];
        if (_partText.isNotEmpty) {
          _previewText += _partText + " ";
          i++;
        } else {
          prayerText = prayerText.substring(
            1,
          );
        }
      }
    }
    _previewText = _previewText.trim();
    if (_previewText.endsWith(",") |
        _previewText.endsWith(";") |
        _previewText.endsWith(".") |
        _previewText.endsWith("!") |
        _previewText.endsWith("?") |
        _previewText.endsWith("-")) {
      _previewText = _previewText.substring(0, _previewText.length - 1);
    }
    return _previewText + "...";
  }

  

  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body.text).documentElement.text;
    return parsedString;
  }

  TextAlign getTextAlign(String textAlignment) {
    switch (textAlignment) {
      case "left":
        return TextAlign.left;
      case "justify":
        return TextAlign.justify;
      case "right":
        return TextAlign.right;
    }
    return null;
  }
}
