import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/language/language.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:selfa/utils/theme/theme_controller.dart';
import 'package:sizer/sizer.dart';

class LanguageSelect extends StatefulWidget {
  const LanguageSelect({Key? key}) : super(key: key);

  @override
  _LanguageSelectState createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect> {
  @override
  Widget build(BuildContext context) {
    bool value = Get.isDarkMode ? true : false;
    final box = GetStorage();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 25.w,
                          margin: const EdgeInsets.all(15),
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 1.w),
                          decoration: BoxDecoration(
                              color: context.theme.scaffoldBackgroundColor),
                          child: Textsax(
                              text: 'setting'.tr,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center)),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Textsax(text: 'theme'.tr, fontSize: 11)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60.w,
                        margin: EdgeInsets.symmetric(vertical: 0.8.h),
                        decoration: BoxDecoration(
                            color: context.theme.listTileTheme.tileColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.changeThemeMode(ThemeMode.dark);
                                Get.changeTheme(ColorController.dark);
                                box.write('theme', 'dark');
                              },
                              child: Container(
                                width: 30.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                    color: box.read('theme') == 'dark'
                                        ? Colorsax.blue
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Iconsax.moon,
                                      color: Colorsax.lightBlue,
                                      size: 27,
                                    ),
                                    Textsax(
                                      text: 'dark_mode'.tr,
                                      fontSize: 11,
                                      color: box.read('theme') == 'dark'
                                          ? Colorsax.white
                                          : Colorsax.darkGrey,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.changeThemeMode(ThemeMode.light);
                                Get.changeTheme(ColorController.light);
                                box.write('theme', 'light');
                              },
                              child: Container(
                                width: 30.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                    color: box.read('theme') == 'light'
                                        ? Colorsax.blue
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Iconsax.sun_1,
                                      color: Colorsax.lightBlue,
                                      size: 27,
                                    ),
                                    Textsax(
                                      text: 'light_mode'.tr,
                                      fontSize: 11,
                                      color: Colorsax.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Textsax(text: 'language'.tr, fontSize: 11)),
                  ListTile(
                    contentPadding: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    leading: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/images/iq.png',
                        width: 12.w,
                      ),
                    ),
                    title: Textsax(
                        text: 'العربية',
                        // textDirection: TextDirection.rtl,
                        fontSize: 13.5),
                    onTap: () {
                      LocalizationService().changeLocale('العربية');
                    },
                  ),
                  SizedBox(height: 2.h),
                  ListTile(
                    contentPadding: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    title: Textsax(
                        text: 'English',
                        // textDirection: TextDirection.ltr,
                        fontSize: 13.5),
                    leading: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/images/uk.png',
                        width: 12.w,
                      ),
                    ),
                    onTap: () {
                      LocalizationService().changeLocale('English');
                    },
                  ),
                ],
              ),
            ),
            Positioned(
                top: 0.h,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 1.5.h, horizontal: 2.5.w),
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Get.theme.listTileTheme.tileColor),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 15.sp,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
