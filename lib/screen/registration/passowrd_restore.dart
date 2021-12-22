import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:selfa/screen/registration/verifcation.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:selfa/utils/txt_field_widget.dart';
import 'package:sizer/sizer.dart';

class RestPassPage extends StatefulWidget {
  const RestPassPage({Key? key}) : super(key: key);

  @override
  State<RestPassPage> createState() => _RestPassPageState();
}

class _RestPassPageState extends State<RestPassPage> {
  late final TextEditingController _phoneTextController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Textsax(text: 'restore'.tr, fontSize: 25),
                    Textsax(text: 'password'.tr, fontSize: 25),
                  ],
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
                  TextInputAction.done,
                  _phoneTextController,
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
          Positioned(
            width: 84.w,
            bottom: 10.h,
            right: 8.2.w,
            child: SizedBox(
              width: 100.w,
              child: MaterialButton(
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
            ),
          )
        ],
      ),
    );
  }
}
