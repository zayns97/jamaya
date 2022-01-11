import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:selfa/screen/onboarding/onboarding.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/language/language.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:selfa/utils/theme/theme_controller.dart';
import 'package:sizer/sizer.dart';

class SetupWizard extends StatefulWidget {
  const SetupWizard({Key? key}) : super(key: key);

  @override
  _SetupWizardState createState() => _SetupWizardState();
}

class _SetupWizardState extends State<SetupWizard> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness:
              Get.isDarkMode ? Brightness.light : Brightness.dark,
        ),
      ),
      body: Stack(
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
                        width: 35.w,
                        height: 35.w,
                        margin: const EdgeInsets.all(15),
                        child: Image.asset('assets/images/icon_lg.png')),
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
                                  color: Get.isDarkMode
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
                                  color: Get.isDarkMode
                                      ? Colors.transparent
                                      : Colorsax.blue,
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
              bottom: 5.h,
              left: 10.w,
              right: 10.w,
              child: MaterialButton(
                onPressed: () {
                  Get.to(() => const OnBoardingPage(
                        initial_page: 0,
                      ));
                },
                padding: EdgeInsets.symmetric(vertical: 2.5.h),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide.none),
                color: Colorsax.blue,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Textsax(
                      text: 'start'.tr,
                      fontSize: 14,
                      color: Colorsax.white,
                      fontWeight: FontWeight.bold),
                ]),
              )),
        ],
      ),
    );
  }
}
