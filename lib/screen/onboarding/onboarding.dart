import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:selfa/screen/registration/login.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key, required this.initial_page})
      : super(key: key);
  final int initial_page;

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  // final box = GetStorage();
  void _onIntroEnd(context) {
    // box.write('onboarding', 1);
    Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.leftToRightJoined,
          child: const LoginPage(),
          childCurrent: widget,
        ));
  }

  Widget _buildImage(String assetName, [double width = 330]) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Image.asset('assets/images/onboarding/$assetName', width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.cairo(
          fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colorsax.blue),
      bodyTextStyle:
          GoogleFonts.cairo(fontSize: 13.sp, fontWeight: FontWeight.w700),
      titlePadding: EdgeInsets.only(top: 70.sp),
      descriptionPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      globalBackgroundColor: Get.theme.scaffoldBackgroundColor,
      key: introKey,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20.sp, right: 20.sp),
            child: Image.asset('assets/images/logo.png', width: 18.w),
          ),
        ),
      ),

      pages: [
        PageViewModel(
          title: 'intro1'.tr,
          body: 'intro1_des'.tr,
          image: _buildImage('ob1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'intro2'.tr,
          body: 'intro2_des'.tr,
          image: _buildImage('ob2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'intro3'.tr,
          body: 'intro3_des'.tr,
          image: _buildImage('ob3.png'),
          decoration: pageDecoration,
        ),
      ],
      initialPage: widget.initial_page,
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,

      skip: Container(
          width: 20.w,
          height: 5.2.h,
          decoration: BoxDecoration(
              color: Colorsax.lightGreen,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Textsax(
                text: 'skip'.tr,
                textAlign: TextAlign.center,
                fontSize: 11.sp,
                color: Colorsax.black),
          )),
      next: Container(
          width: 20.w,
          height: 5.2.h,
          decoration: BoxDecoration(
              color: Colorsax.blue, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Textsax(
                text: 'next'.tr,
                textAlign: TextAlign.center,
                fontSize: 11.sp,
                color: Colors.white),
          )),
      done: Container(
          width: 20.w,
          height: 5.2.h,
          decoration: BoxDecoration(
              color: Colorsax.blue, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Textsax(
                text: 'start'.tr,
                textAlign: TextAlign.center,
                maxChars: 6,
                fontSize: 11.sp,
                color: Colors.white),
          )),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: EdgeInsets.all(3.h),
      controlsPadding: kIsWeb
          ? EdgeInsets.all(12.sp)
          : EdgeInsets.symmetric(horizontal: 1.1.w),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: Colorsax.lightBlue,
        activeColor: Colorsax.blue,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      // dotsContainerDecorator: ShapeDecoration(
      //   color: Colorsax.lightGreen,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(20)),
      //   ),
      // ),
    );
  }
}
