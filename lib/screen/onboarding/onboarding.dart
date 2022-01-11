import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.fade, child: LoginPage()));
  }

  // Widget _buildImage(String assetName, double height,
  //     {double width = 300, bool repeat = true}) {
  //   return Padding(
  //     padding: EdgeInsets.only(top: 5.h),
  //     child: Lottie.asset('assets/images/onboarding/$assetName',
  //         width: width, fit: BoxFit.fitWidth, repeat: repeat, height: height),
  //   );
  // }
  Widget _buildImage(String assetName) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: SvgPicture.asset('assets/images/onboarding/$assetName',
          width: 90.w, fit: BoxFit.fitWidth),
    );
  }

  final box = GetStorage();
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
      isBottomSafeArea: true,
      key: introKey,
      initialPage: widget.initial_page,
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 3,
      nextFlex: 3,
      dotsFlex: 6,
      globalHeader: Align(
        alignment: box.read('lang') == 'English'
            ? Alignment.topLeft
            : Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 1.5.h, right: 5.w, left: 5.w),
            child: Image.asset(
                Get.isDarkMode
                    ? 'assets/images/logo_dark.png'
                    : 'assets/images/logo_light.png',
                width: 20.w),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: 'intro1'.tr,
          body: 'intro1_des'.tr,
          image: _buildImage('obx1.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'intro2'.tr,
          body: 'intro2_des'.tr,
          image: _buildImage('obx2.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'intro3'.tr,
          body: 'intro3_des'.tr,
          image: _buildImage('obx3.svg'),
          decoration: pageDecoration,
        ),
      ],
      skip: Container(
        width: 20.w,
        height: 4.5.h,
        // decoration: BoxDecoration(
        //     color: Colorsax.lightBlue, borderRadius: BorderRadius.circular(25)
        // ),
        child: Textsax(
          height: 0.23.h,
          text: 'skip'.tr,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
          maxChars: 6,
          fontSize: 10.sp,
          // color: Colorsax.blue
        ),
      ),
      next: Container(
          width: 12.w,
          height: 4.5.h,
          // decoration:
          //     BoxDecoration(shape: BoxShape.circle, color: Colorsax.lightBlue),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16.sp,
            // color: Colorsax.blue,
          )),
      done: Container(
        width: 20.w,
        height: 4.5.h,
        // decoration: BoxDecoration(
        //     color: Colorsax.lightBlue, borderRadius: BorderRadius.circular(25)),
        child: Textsax(
          height: 0.23.h,
          text: 'start'.tr,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
          maxChars: 6,
          fontSize: 10.sp,
          // color: Colorsax.blue
        ),
      ),
      curve: Curves.fastOutSlowIn,
      controlsMargin: EdgeInsets.all(3.h),
      controlsPadding: kIsWeb
          ? EdgeInsets.all(12.sp)
          : EdgeInsets.symmetric(horizontal: 1.1.w),
      dotsDecorator: DotsDecorator(
        spacing: const EdgeInsets.symmetric(horizontal: 8),
        size: const Size(10.0, 10.0),
        color: Colorsax.lightBlue,
        activeColor: Colorsax.blue,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: ShapeDecoration(
        color: Get.theme.listTileTheme.tileColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }
}
