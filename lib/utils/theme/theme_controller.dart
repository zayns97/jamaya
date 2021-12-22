import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:selfa/utils/language/language.dart';

import '../colors.dart';

class ColorController extends GetxController {
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (box.read('lang') == 'العربية') {
        LocalizationService().changeLocale('العربية');
      } else if (box.read('lang') == 'English') {
        LocalizationService().changeLocale('English');
      } else {}
      if (box.read('theme') == 'dark') {
        print('get ${box.read('theme')}');
        Get.changeThemeMode(ThemeMode.dark);
        Get.changeTheme(ColorController.dark);
        box.write('theme', 'dark');
      } else if (box.read('theme') == 'light') {
        Get.changeThemeMode(ThemeMode.light);
        Get.changeTheme(ColorController.light);
        box.write('theme', 'light');
        print('get ${box.read('theme')}');
      } else {
        print('else theme');
      }
    });
  }

  // LIGHT
  // THEME
  static final light = ThemeData.light().copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    canvasColor: Colorsax.blue,
    backgroundColor: Colorsax.blueGrey,
    scaffoldBackgroundColor: Colorsax.blueGrey,
    iconTheme: IconThemeData(color: Colorsax.darkGrey),
    listTileTheme: ListTileThemeData(tileColor: Colorsax.white),
    primaryColor: Colorsax.blue,
    navigationBarTheme: NavigationBarThemeData(backgroundColor: Colorsax.white),
    appBarTheme: AppBarTheme(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
        // actionsIconTheme: IconThemeData(color: Colorsax.black),
        backgroundColor: Colorsax.blueGrey,
        titleTextStyle: TextStyle(color: Colorsax.black)),
  );

  // DARK
  // THEME
  static final dark = ThemeData.dark().copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    canvasColor: Colorsax.darkGrey,
    backgroundColor: Colorsax.darkGrey,
    navigationBarTheme: NavigationBarThemeData(backgroundColor: Colorsax.black),
    iconTheme: IconThemeData(color: Colorsax.lightGrey),
    listTileTheme: ListTileThemeData(tileColor: Colorsax.black),
    primaryColor: Colorsax.black,
    scaffoldBackgroundColor: Colorsax.darkGrey,
    appBarTheme: AppBarTheme(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        // actionsIconTheme: IconThemeData(color: Colorsax.blueGrey),
        backgroundColor: Colorsax.darkGrey,
        titleTextStyle: TextStyle(color: Colorsax.blueGrey)),
  );
  // DARK
  // THEME
  static final fallback = ThemeData.fallback().copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    canvasColor: Colorsax.blue,
    backgroundColor: Colorsax.blueGrey,
    navigationBarTheme: NavigationBarThemeData(backgroundColor: Colorsax.white),
    iconTheme: IconThemeData(color: Colorsax.darkGrey),
    listTileTheme: ListTileThemeData(tileColor: Colorsax.white),
    primaryColor: Colorsax.blueGrey,
    scaffoldBackgroundColor: Colorsax.blueGrey,
    // popupMenuTheme: PopupMenuThemeData(color: Colorsax.blueGrey),
    appBarTheme: AppBarTheme(
        // systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: Colors.transparent,
        //     statusBarBrightness: Brightness.light,
        //     statusBarIconBrightness: Brightness.light),
        // actionsIconTheme: IconThemeData(color: Colorsax.black),
        backgroundColor: Colorsax.blueGrey,
        titleTextStyle: TextStyle(color: Colorsax.black)),
  );
}
