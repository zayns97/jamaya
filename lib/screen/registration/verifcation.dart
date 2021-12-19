import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:selfa/home_structure.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:timer_button/timer_button.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key, required this.autofocus})
      : super(key: key);
  final bool autofocus;

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  bool _onEditing = true;
  late String _code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: color.main,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 1.h, right: 1.h),
          child: Image.asset(
            'assets/images/logo.png',
            width: 18.w,
          ),
        ),
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
                    text: 'enter'.tr,
                    fontSize: 25,
                  ),
                  Textsax(
                    text: 'verif_code'.tr,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Textsax(text: 'verif_hint'.tr, fontSize: 13.5),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerificationCode(
                  itemSize: 60,
                  textStyle: TextStyle(fontSize: 22.sp, color: Colorsax.blue),
                  keyboardType: TextInputType.number,
                  fillColor: context.theme.cardColor,
                  underlineColor: Colorsax.blue,
                  underlineWidth: 2,
                  autofocus: widget.autofocus,
                  underlineUnfocusedColor: Colors.transparent,
                  length: 4,
                  // clearAll is NOT required, you can delete it
                  // takes any widget, so you can implement your design

                  onCompleted: (String value) {
                    setState(() {
                      _code = value;
                    });
                  },
                  onEditing: (bool value) {
                    setState(() {
                      _onEditing = value;
                    });
                    if (!_onEditing) FocusScope.of(context).unfocus();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              width: 100.w,
              child: TimerButton(
                label: 'resend'.tr,
                disabledColor: Colors.transparent,
                color: Colors.transparent,
                timeOutInSeconds: 60,
                onPressed: () {
                  Get.snackbar('انتظر', 'شوية');
                },
                buttonType: ButtonType.TextButton,
                disabledTextStyle: GoogleFonts.cairo(fontSize: 20.0),
                activeTextStyle: GoogleFonts.cairo(fontSize: 20.0),
              ),
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
                        child: const MyHomePage()));
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
