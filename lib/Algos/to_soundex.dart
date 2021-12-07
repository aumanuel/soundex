import 'package:soundex_converter/Algos/find_number.dart';
import 'package:soundex_converter/globals.dart';

class Soundex {
  String rowStr;
  List<String> splitLst;
  List<String> convertedLst;
  String convertedStr;

  Soundex({
    this.rowStr = "",
    this.splitLst = const [],
    this.convertedLst = const [],
    this.convertedStr = "",
  });

  fullProcess() {
    splitStr();
    convertLst();
    strFromLst();
  }

  splitStr() {
    splitLst = rowStr.split(" ");
  }

  convertLst() {
    List<String> result = [];
    String conversion = "";
    String lastChar = "";

    for (int lstIndex = 0; lstIndex < splitLst.length; lstIndex++) {
      for (int strIndex = 0; strIndex < splitLst[lstIndex].length; strIndex++) {
        if (conversion.isEmpty) {
          if (acceptedChars.contains(splitLst[lstIndex][strIndex])) {
            lastChar = splitLst[lstIndex][strIndex];
            conversion += lastChar;
          } else if (accents.contains(splitLst[lstIndex][strIndex])) {
            lastChar =
                deletedAccents[accents.indexOf(splitLst[lstIndex][strIndex])];
            conversion += lastChar;
          }
        } else if (conversion.length < 4) {
          if (splitLst[lstIndex][strIndex] != lastChar) {
            if (consonants.contains(splitLst[lstIndex][strIndex])) {
              lastChar = splitLst[lstIndex][strIndex];
              conversion += findNumber(lastChar);
            }
          }
        } else {
          strIndex = splitLst[lstIndex].length;
        }
      }

      if (conversion.isNotEmpty) {
        if (conversion.length < 4) {
          for (int index = conversion.length; index < 4; index++) {
            conversion += "0";
          }
        }

        result.add(conversion);
        conversion = "";
      }
    }

    convertedLst = result;
  }

  strFromLst() {
    convertedStr = convertedLst.join(" ");
  }
}
