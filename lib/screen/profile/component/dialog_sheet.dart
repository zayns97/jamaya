import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:selfa/screen/registration/login.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

void showLogoutDialog() {
  Get.bottomSheet(
    Container(
      height: 20.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: const Radius.circular(25),
            topLeft: const Radius.circular(25)),
        color: Get.theme.listTileTheme.tileColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Iconsax.logout),
              SizedBox(
                width: 2.w,
              ),
              Textsax(
                text: 'want_logout'.tr,
                height: 2,
                fontSize: 13,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  Get.back();
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide.none),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Textsax(
                      text: 'cancel'.tr,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ]),
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(LoginPage());
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide.none),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Textsax(
                      text: 'logout'.tr,
                      fontSize: 14,
                      color: Colorsax.pink,
                      fontWeight: FontWeight.bold),
                ]),
              ),
            ],
          )
        ],
      ),
      // padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
    ),
    isDismissible: true,
    enableDrag: true,
  );
}
