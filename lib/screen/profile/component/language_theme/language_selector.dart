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
                              color: context.theme.listTileTheme.tileColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Textsax(
                              text: 'setting'.tr,
                              fontSize: 13.5,
                              textAlign: TextAlign.center)),
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
                  SizedBox(height: 2.h),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Textsax(text: 'setting'.tr, fontSize: 11)),
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    title: Textsax(text: 'dark_mode'.tr, fontSize: 13.5),
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Iconsax.moon,
                        color: Colorsax.lightBlue,
                        size: 27,
                      ),
                    ),
                    trailing: CupertinoSwitch(
                      value: value,
                      activeColor: Colorsax.lightBlue,
                      trackColor: Colorsax.lightBlue,
                      thumbColor:
                          Get.isDarkMode ? Colorsax.black : Colorsax.white,
                      onChanged: (value) {
                        if (Get.isDarkMode) {
                          Get.changeThemeMode(ThemeMode.light);
                          Get.changeTheme(ColorController.light);
                          box.write('theme', 'light');
                          // print('set ${box.read('theme')}');
                        } else if (!Get.isDarkMode) {
                          Get.changeThemeMode(ThemeMode.dark);
                          Get.changeTheme(ColorController.dark);
                          box.write('theme', 'dark');
                          // print('set ${box.read('theme')}');
                        }
                      },
                    ),
                    contentPadding: const EdgeInsets.all(5),
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
