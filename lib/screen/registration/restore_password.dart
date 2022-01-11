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

import 'verifcation.dart';

class RestPassPage extends StatefulWidget {
  const RestPassPage({Key? key}) : super(key: key);

  @override
  State<RestPassPage> createState() => _RestPassPageState();
}

class _RestPassPageState extends State<RestPassPage> {
  late final TextEditingController _phoneTextController =
      TextEditingController(text: '');
  final phoneFocusNode = FocusNode();

  // final bool _obscureText = true;
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Image.asset(
            Get.isDarkMode
                ? 'assets/images/logo_dark.png'
                : 'assets/images/logo_light.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        leadingWidth: 30.w,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Row(
                children: [
                  Textsax(
                    text: 'restore'.tr,
                    fontSize: 25,
                  ),
                  Textsax(
                    text: 'password'.tr,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Textsax(text: 'rest_hint'.tr, fontSize: 13.5),
            SizedBox(
              height: 10.h,
            ),
            txtFormField(
                'phone_num'.tr,
                Iconsax.call,
                TextInputType.phone,
                TextInputAction.next,
                _phoneTextController,
                'Phone number is required',
                context,
                phoneFocusNode),
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
                    text: 'confirm'.tr,
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
