import 'package:soundex_converter/globals.dart';

String findNumber(String char) {
  String ret = "";

  if (choosenLanguage == "fr") {
    for (int x = 1; x < valuesFR.length; x++) {
      if (valuesFR[x].contains(char)) {
        return x.toString();
      }
    }
  } else if (choosenLanguage == "en") {
    for (int x = 1; x < valuesEN.length; x++) {
      if (valuesEN[x].contains(char)) {
        return x.toString();
      }
    }
  }

  return ret;
}
