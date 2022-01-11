import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:selfa/utils/txt_field_widget.dart';
import 'package:sizer/sizer.dart';

import 'component/register_functions.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

// GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
late GlobalKey<FormState> registerFormKey;

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController regNameTextController = TextEditingController(text: '');
  TextEditingController regPhoneTextController =
      TextEditingController(text: '');
  TextEditingController regPassTextController = TextEditingController(text: '');
  TextEditingController regRepPassTextController =
      TextEditingController(text: '');
  final fullNameFocusNode = FocusNode();
  final regPhoneFocusNode = FocusNode();
  final regPasswordFocusNode = FocusNode();
  final repPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    regNameTextController.dispose();
    regPhoneTextController.dispose();
    regPassTextController.dispose();
    regRepPassTextController.dispose();

    fullNameFocusNode.dispose();
    regPhoneFocusNode.dispose();
    regPasswordFocusNode.dispose();
    repPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    registerFormKey = GlobalKey<FormState>();
    super.initState();
  }

  // final bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          key: registerFormKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Row(
                  children: [
                    Textsax(
                      text: 'welcome'.tr,
                      fontSize: 25,
                    ),
                    Textsax(
                      text: 'app_name'.tr,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Textsax(text: 'have_account'.tr, fontSize: 13.5),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: LoginPage()));
                      },
                      child: Textsax(
                          text: 'login_now'.tr,
                          fontSize: 13.5,
                          color: Colorsax.blue,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Textsax(text: 'sign_hint'.tr, fontSize: 13.5),
              SizedBox(
                height: 6.h,
              ),
              txtFormField(
                  'fullname'.tr,
                  Iconsax.frame_1,
                  TextInputType.name,
                  TextInputAction.next,
                  regNameTextController,
                  'Full name is required',
                  context,
                  fullNameFocusNode),
              SizedBox(
                height: 2.h,
              ),
              txtFormField(
                  'phone_num'.tr,
                  Iconsax.call,
                  TextInputType.phone,
                  TextInputAction.next,
                  regPhoneTextController,
                  'Phone number is required',
                  context,
                  regPhoneFocusNode),
              SizedBox(
                height: 2.h,
              ),
              txtFormField(
                  'password'.tr,
                  Iconsax.key,
                  TextInputType.visiblePassword,
                  TextInputAction.done,
                  regPassTextController,
                  'Password is required',
                  context,
                  regPasswordFocusNode),
              SizedBox(
                height: 2.h,
              ),
              txtFormField(
                  'rep_password'.tr,
                  Iconsax.key,
                  TextInputType.visiblePassword,
                  TextInputAction.done,
                  regRepPassTextController,
                  'Repeated Password is required',
                  context,
                  repPasswordFocusNode),
              SizedBox(
                height: 4.h,
              ),
              MaterialButton(
                onPressed: () {
                  submitFormOnRegister(context);
                },
                // onPressed: () {
                //   Navigator.push(
                //       context,
                //       PageTransition(
                //           type: PageTransitionType.fade,
                //           child: const PhoneVerification(
                //             autofocus: true,
                //           )));
                //   // mainController.login_fun(_phoneTextController.text,
                //   //     _passTextController.text);
                // },
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide.none),
                color: Colorsax.blue,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Textsax(
                      text: 'create'.tr,
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
