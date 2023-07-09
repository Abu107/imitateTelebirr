import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'language.dart';
var lang;
   // const List<String> list = <String>['English', 'Amharic', 'Tigrigna', 'Afan Oromo','Somali'];
    const List<String> list = <String>[
  'English',
  'አማርኛ',
  'العربية '
];
class Home1 extends StatefulWidget {
  const Home1({super.key});
  @override
  State<Home1> createState() => _Home1State();
}
class _Home1State extends State<Home1> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
return  DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              underline: Container(height: 2,color: Color.fromARGB(255, 255, 255, 255),),
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });

                for (var e in Language.languageList()) {
                  if (dropdownValue == e.name) {
                    //   dropdownValue
                    lang = e;
                  }
                }
                Get.find<LocaleCont>() ////////////////////////
                    .updateLocale(
                        _changeLanguage(lang, context)); ////////////////
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
  }
Locale _changeLanguage(Language language, context) {
    Locale _a;
    switch (language.languageCode) {
      case ENGLISH: // here ENGLISH is a constant that I've created in another file called `constant.dart` file and same for other languages
        _a = Locale(language.languageCode, "US");
        break;
      case NEPALI:
        _a = Locale(language.languageCode, "NP");
        break;
      case Arabic:
        _a = Locale(language.languageCode, "SA");
        break;
      case SPANISH:
        _a = Locale(language.languageCode, 'AR');
        break;
      case AMHARIC:
        _a = Locale(language.languageCode);
        break;
      case Tigrigna:
        _a = Locale(language.languageCode);
        break;

      default:
        _a = Locale(language.languageCode, 'US');
    }
    return _a;
  }
  //////end///////////////
}

///////////////////////
const String ENGLISH = "en";
const String NEPALI = "ne";
const String SPANISH = "es";
const String AMHARIC = "am";
const String Tigrigna = "ti";
const String Arabic = "ar";

