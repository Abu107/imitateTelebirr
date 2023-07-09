import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LocaleCont extends GetxController {
  Locale locale = Locale('en', "US");
  updateLocale(Locale a) {
    locale = a;
    update();
  }
}
class Language {
  final String name;
  //final String flag;
  final String languageCode;
  Language(this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language("English", "en"),
      Language("नेपाली", "ne"),
      Language("Española", "es"),
      Language("አማርኛ", "am"),
      Language("Tigrigna", "ti"),
      Language('العربية ', 'ar')
    ];
  }
}
class AppLocalization {
  late final Locale _locale;
  AppLocalization(this._locale);
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }
  late Map<String, String> _localizedValues;

  Future loadLanguage() async {
    String jsonStringValues =
        await rootBundle.loadString("asset/lang/${_locale.languageCode}.json");
    Map<String, dynamic> mappedValues = json.decode(jsonStringValues);

    _localizedValues =
        mappedValues.map((key, value) => MapEntry(key, value.toString()));
  }

  String? getTranslatedValue(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "ne", "es","am","ti","ar"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = AppLocalization(locale);
    await appLocalization.loadLanguage();
    return appLocalization;
  }

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}