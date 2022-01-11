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

import 'component/login_functions.dart';
import 'register.dart';
import 'restore_password.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

late GlobalKey<FormState> loginFormKey;

// GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneTextController = TextEditingController(text: '');
  TextEditingController passTextController = TextEditingController(text: '');

  FocusNode phoneFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  @override
  void initState() {
    loginFormKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    phoneTextController.dispose();
    passTextController.dispose();
    passFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

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
        child: Form(
          key: loginFormKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
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
                                child: RegisterPage()));
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
                  phoneTextController,
                  'Please enter a valid phone number',
                  context,
                  phoneFocusNode),
              SizedBox(
                height: 2.h,
              ),
              txtFormField(
                  'password'.tr,
                  Iconsax.key,
                  TextInputType.visiblePassword,
                  TextInputAction.send,
                  passTextController,
                  'Please enter a valid password',
                  context,
                  passFocusNode,
                  onEditingComplete: true),
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
                  submitFormOnLogin(context);
                },
                // onPressed: () {
                //   // Navigator.push(
                //   //     context,
                //   //     PageTransition(
                //   //         type: PageTransitionType.fade,
                //   //         child: const PhoneVerification(
                //   //           autofocus: true,
                //   //         )));
                //
                //   // mainController.login_fun(_phoneTextController.text,
                //   //     _passTextController.text);
                // },
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
      ),
    );
  }
}
