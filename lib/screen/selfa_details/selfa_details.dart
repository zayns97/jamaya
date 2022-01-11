import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:selfa/screen/edit_selfa/edit_selfa.dart';
import 'package:selfa/screen/selfa_details/model/user_model.dart';
import 'package:selfa/screen/selfa_feed/model/self_model.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import '../../home_structure.dart';
import 'component/users_list.dart';

class SelfaDetails extends StatefulWidget {
  const SelfaDetails({Key? key, required this.selfa}) : super(key: key);
  final Selfa selfa;

  @override
  State<SelfaDetails> createState() => _SelfaDetailsState();
}

class _SelfaDetailsState extends State<SelfaDetails> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            width: 100.w,
            height: 30.h,
            child: Container(
              decoration: BoxDecoration(
                  color: Get.theme.canvasColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4.h, left: 3.w, right: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            width: 10.w,
                            height: 10.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Get.theme.listTileTheme.tileColor),
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 15.sp,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(EditSelfa(
                                  selfa: widget.selfa,
                                ));
                              },
                              child: Container(
                                width: 10.w,
                                height: 10.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Get.theme.listTileTheme.tileColor),
                                child: const Icon(Iconsax.edit_2),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            GestureDetector(
                              onTap: _captureAndSharePng,
                              child: Container(
                                width: 10.w,
                                height: 10.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Get.theme.listTileTheme.tileColor),
                                child: const Icon(Iconsax.send_2),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Screenshot(
                      controller: screenshotController,
                      child: Container(
                        width: 35.w,
                        height: 35.w,
                        padding: EdgeInsets.symmetric(vertical: 0.7.h),
                        decoration: BoxDecoration(
                            color: Colorsax.blueGrey,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: PrettyQr(
                            elementColor: Colorsax.darkGrey,
                            image:
                                const AssetImage('assets/images/icon_50.png'),
                            data: widget.selfa.selfa_qr_code,
                            size: 30.w,
                            errorCorrectLevel: QrErrorCorrectLevel.M,
                            roundEdges: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30.h,
            left: 5.w,
            width: 90.w,
            height: 70.h,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                  width: 90.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                      color: Get.theme.listTileTheme.tileColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Textsax(
                                  text: widget.selfa.selfa_amount,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              Textsax(
                                text: 'iqd'.tr,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(1.9.w),
                                decoration: BoxDecoration(
                                    color: Colorsax.lightGreen,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Textsax(
                                    text: widget.selfa.privacy.tr,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colorsax.green),
                              ),
                              SizedBox(
                                width: 1.5.w,
                              ),
                              Container(
                                padding: EdgeInsets.all(1.9.w),
                                decoration: BoxDecoration(
                                    color: Colorsax.lightBlue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Textsax(
                                  text: widget.selfa.selfa_status.tr,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: Colorsax.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Textsax(
                          text: 'احمد محمد محمود',
                          fontSize: 10,
                          color: Colorsax.grey,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colorsax.lightGrey,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(1.9.w),
                              child: Row(
                                children: [
                                  Textsax(
                                      text: 'share_amount'.tr,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colorsax.black),
                                  Textsax(
                                      text: ': ${widget.selfa.share_amount}',
                                      color: Colorsax.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                  Textsax(
                                      text: 'iqd'.tr,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colorsax.blue),
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Get.theme.listTileTheme.tileColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Textsax(
                      text: widget.selfa.selfa_description,
                      fontSize: 10.5,
                      height: 2,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Textsax(text: 'subscribers'.tr, fontSize: 11.5),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  width: 90.w,
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: Get.theme.listTileTheme.tileColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (_context, index) {
                      return UserListCard(
                        user: users[index],
                        index: index.toInt(),
                      );
                    },
                    itemCount: users.length,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          Positioned(
            width: 84.w,
            bottom: 1.5.h,
            right: 8.2.w,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: const MyHomePage()));
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
                    text: 'start_loan'.tr,
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)
              ]),
            ),
          ),
        ],
      ),
    );
  }

  void _captureAndSharePng() async {
    final uint8List = await screenshotController.capture();
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/image.png');
    await file.writeAsBytes(uint8List!);
    await Share.shareFiles(
      [file.path],
      text: 'share_qr_text'.tr,
    );
  }
}
