import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:selfa/screen/registration/login.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

import '../../utils/tiles.dart';
import 'component/edit_account/edit_account.dart';
import 'component/language_theme/language_selector.dart';
import 'component/my_selfa/my_selfa.dart';

class ProfileTilesPage extends StatefulWidget {
  const ProfileTilesPage({Key? key}) : super(key: key);

  @override
  State<ProfileTilesPage> createState() => _ProfileTilesPageState();
}

class _ProfileTilesPageState extends State<ProfileTilesPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final box = GetStorage();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.5.h),
                  child: Textsax(
                      text: 'my_account'.tr,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center),
                )
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Textsax(text: 'account'.tr, fontSize: 11)),
                    Tilesax(
                        title: 'احمد محمد محمود',
                        subtitle: '0781234567',
                        context: context,
                        leading: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colorsax.lightBlue,
                              borderRadius: BorderRadius.circular(30)),
                          child: Icon(
                            Iconsax.frame_1,
                            color: Colorsax.blue,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colorsax.blue,
                        ),
                        navigateTo: const EditAccountPage()),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Textsax(text: 'setting'.tr, fontSize: 11)),
                    Tilesm(
                        title: 'my_loan'.tr,
                        leading: Iconsax.wallet_check,
                        context: context,
                        navigateTo: const MySelfaList()),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Tilesm(
                        title: 'setting'.tr,
                        leading: Iconsax.setting,
                        context: context,
                        navigateTo: const LanguageSelect()),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Tilesm(
                        title: 'report_an_issue'.tr,
                        leading: Iconsax.warning_2,
                        context: context,
                        navigateTo: const LoginPage()),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 45.w,
                          height: 65,
                          decoration: BoxDecoration(
                              color: Colorsax.fblue,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset('assets/face.svg'),
                              Textsax(
                                  text: 'Jamaya - جمعية',
                                  fontSize: 12,
                                  color: Colorsax.white)
                            ],
                          ),
                        ),
                        Container(
                          width: 45.w,
                          height: 65,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                stops: const [-20, 20],
                                colors: [Colorsax.insta1, Colorsax.insta2],
                                begin: const Alignment(-1, -2),
                                end: const Alignment(2, 1),
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset('assets/insta.svg'),
                              Textsax(
                                  text: '@jamaya_iq',
                                  fontSize: 12,
                                  textDirection: TextDirection.ltr,
                                  color: Colorsax.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      title: Textsax(
                          text: 'logout'.tr,
                          fontSize: 13.5,
                          color: Colorsax.pink),
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Iconsax.logout,
                          color: Colorsax.pink,
                          size: 27,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(5),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
