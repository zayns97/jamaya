import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:selfa/screen/selfa_details/model/user_model.dart';
import 'package:selfa/screen/selfa_feed/model/self_model.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

import '../../home_structure.dart';
import 'component/users_list.dart';

class SelfaDetails extends StatelessWidget {
  const SelfaDetails({Key? key, required this.selfa}) : super(key: key);
  final Selfa selfa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
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
                              onTap: () {},
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
                              onTap: () {},
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
                          image: const AssetImage('assets/images/icon_50.png'),
                          data: selfa.selfa_qr_code,
                          size: 30.w,
                          errorCorrectLevel: QrErrorCorrectLevel.M,
                          roundEdges: true,
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
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                  width: 90.w,
                  height: 15.h,
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
                                  text: selfa.selfa_amount,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              Textsax(
                                text: 'iqd'.tr,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              selfa.is_private
                                  ? Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colorsax.lightGreen,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Textsax(
                                          text: 'private'.tr,
                                          fontSize: 11,
                                          color: Colorsax.green),
                                    )
                                  : Container(),
                              SizedBox(
                                width: 1.5.w,
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: selfa.selfa_status == 'غير مكتملة'
                                        ? Colorsax.lightBlue
                                        : Colorsax.lightGreen,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Textsax(
                                  text: selfa.selfa_status,
                                  fontSize: 11,
                                  color: selfa.selfa_status == 'غير مكتملة'
                                      ? Colorsax.blue
                                      : Colorsax.green,
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
                                  color: Colorsax.lightBlue,
                                  borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Textsax(
                                      text: 'share_amount'.tr,
                                      fontSize: 10.5,
                                      color: Colorsax.black),
                                  Textsax(
                                      text: ': ${selfa.share_amount}',
                                      color: Colorsax.black,
                                      fontSize: 10.5),
                                  Textsax(
                                      text: 'iqd'.tr,
                                      fontSize: 10.5,
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
                      text: selfa.selfa_description,
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
}
