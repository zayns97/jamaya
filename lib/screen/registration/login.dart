import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:selfa/utils/txt_field_widget.dart';
import 'package:sizer/sizer.dart';

import 'passowrd_restore.dart';
import 'register.dart';
import 'verifcation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _phoneTextController =
      TextEditingController(text: '');
  late final TextEditingController _passTextController =
      TextEditingController(text: '');
  // final bool _obscureText = true;
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.only(right: 4.w),
          child: Image.asset(
            Get.isDarkMode
                ? 'assets/images/logo_dark.png'
                : 'assets/images/logo_light.png',
            fit: BoxFit.fitWidth,
            width: 22.w,
          ),
        ),
        leadingWidth: 22.w,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Row(
                children: [
                  Textsax(
                    text: 'sign'.tr,
                    fontSize: 25,
                  ),
                  Textsax(
                    text: 'in'.tr,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                Textsax(text: 'dont_have_account'.tr, fontSize: 13.5),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const RegisterPage()));
                    },
                    child: Textsax(
                        text: 'create_account'.tr,
                        fontSize: 13.5,
                        color: Colorsax.blue,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Textsax(text: 'login_hint'.tr, fontSize: 13.5),
            SizedBox(
              height: 6.h,
            ),
            txtFormField(
              'phone_num'.tr,
              Iconsax.call,
              TextInputType.phone,
              TextInputAction.next,
              _phoneTextController,
            ),
            SizedBox(
              height: 2.h,
            ),
            txtFormField(
              'password'.tr,
              Iconsax.key,
              TextInputType.visiblePassword,
              TextInputAction.done,
              _passTextController,
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Textsax(text: 'forget'.tr, fontSize: 13.5),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const RestPassPage()));
                    },
                    child: Textsax(
                        text: 'rest_pass'.tr,
                        fontSize: 13.5,
                        color: Colorsax.blue,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: const PhoneVerification(
                          autofocus: true,
                        )));
                // mainController.login_fun(_phoneTextController.text,
                //     _passTextController.text);
              },
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide.none),
              color: Colorsax.blue,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Textsax(
                    text: 'login'.tr,
                    fontSize: 14,
                    color: Colorsax.white,
                    fontWeight: FontWeight.bold),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
