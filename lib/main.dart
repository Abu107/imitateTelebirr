import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:imitate_telebirr/header.dart';
import 'package:imitate_telebirr/home1.dart';
import 'package:google_fonts/google_fonts.dart';
import 'body_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'language.dart';

const List<String> list = <String>[
  'English',
  'አማርኛ',
  'العربية '
];
var lang;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LocaleCont());
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<LocaleCont>(
      //////////////////
      builder: (cont) => MaterialApp(
        builder: FToastBuilder(),
        /////////////////////
        locale: cont.locale, //////////////////////
        debugShowCheckedModeBanner: false,
        title: 'Z2 Birr',
        ///////////start//////////////
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalization.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ne', 'NP'),
          Locale('es', 'AR'),
          Locale('ar', 'SA'),
          Locale('am'),
          Locale('ti'),
        ],
        //////////////end/////////////
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = list.first;
  Home1 h1 = Home1();
  Header head1 = Header();
  BodyPage bp1 = BodyPage();
  @override
  Widget build(BuildContext context) {
    Get.put(LocaleCont()); /////////////////////////////
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 249, 255, 244),
        ),
        child: SafeArea(
          child: ListView(children: [
            head1,
            // Text(AppLocalizations.of(context)!.helloWorld),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                h1,
              ],
            ),
            bp1,
          ]),
        ),
      ),
     
    );
  }

  //////////start//////////////////////
}