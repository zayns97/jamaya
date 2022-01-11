import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

void showFilterDialog() {
  Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            decoration: BoxDecoration(
                // color: Get.theme.listTileTheme.tileColor,
                color: Get.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Textsax(
                    text: 'filter'.tr,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
            color: Get.theme.scaffoldBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Textsax(
                    text: 'loanAmount'.tr,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            decoration: BoxDecoration(
              color: Get.theme.scaffoldBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 40.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Textsax(
                          text: 'from'.tr,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                          width: 28.w,
                          height: 4.h,
                          child: TextField(
                            maxLines: 1,
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            style: GoogleFonts.cairo(
                              height: 1,
                              fontSize: 10.sp,
                            ),
                            cursorHeight: 17,
                            decoration: InputDecoration(
                              filled: true,
                              counterText: '',
                              fillColor: Get.theme.listTileTheme.tileColor,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Textsax(text: '-', fontSize: 13, fontWeight: FontWeight.bold),
                SizedBox(
                  width: 40.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Textsax(
                          text: 'to'.tr,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                          width: 28.w,
                          height: 4.h,
                          child: TextField(
                            maxLines: 1,
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            style: GoogleFonts.cairo(
                              height: 1,
                              fontSize: 10.sp,
                            ),
                            cursorHeight: 17,
                            decoration: InputDecoration(
                              filled: true,
                              counterText: '',
                              fillColor: Get.theme.listTileTheme.tileColor,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
            color: Get.theme.scaffoldBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Textsax(
                    text: 'shareAmount'.tr,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            decoration: BoxDecoration(
              color: Get.theme.scaffoldBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 40.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Textsax(
                          text: 'from'.tr,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                          width: 28.w,
                          height: 4.h,
                          child: TextField(
                            maxLines: 1,
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            style: GoogleFonts.cairo(
                              height: 1,
                              fontSize: 10.sp,
                            ),
                            cursorHeight: 17,
                            decoration: InputDecoration(
                              filled: true,
                              counterText: '',
                              fillColor: Get.theme.listTileTheme.tileColor,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Textsax(text: '-', fontSize: 13, fontWeight: FontWeight.bold),
                SizedBox(
                  width: 40.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Textsax(
                          text: 'to'.tr,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                          width: 28.w,
                          height: 4.h,
                          child: TextField(
                            maxLines: 1,
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            style: GoogleFonts.cairo(
                              height: 1,
                              fontSize: 10.sp,
                            ),
                            cursorHeight: 17,
                            decoration: InputDecoration(
                              filled: true,
                              counterText: '',
                              fillColor: Get.theme.listTileTheme.tileColor,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                  color: Colorsax.blue,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textsax(
                      text: 'filter'.tr,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colorsax.white)
                ],
              ),
            ),
          ),
        ],
      ),
      isDismissible: true,
      enableDrag: true,
      ignoreSafeArea: false);
}

void showSortDialog() {
  Get.bottomSheet(
    Container(
      height: 33.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Get.theme.scaffoldBackgroundColor,
      ),
      // padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Textsax(
                    text: 'sortby'.tr,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
              ),
              child: Textsax(
                text: 'loanAmountAscending'.tr,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            height: 1.h,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
              ),
              child: Textsax(
                text: 'loanAmountDescending'.tr,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            height: 1.h,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
              ),
              child: Textsax(
                text: 'shareAmountAscending'.tr,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            height: 1.h,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
              ),
              child: Textsax(
                text: 'shareAmountDescending'.tr,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    ),
    isDismissible: true,
    enableDrag: true,
  );
}
