import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:iconsax/iconsax.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

Widget dash1({required int selfaCount}) {
  return Stack(
    children: [
      Container(
        height: 24.h,
        width: 95.w,
        child: SvgPicture.asset(
          'assets/images/dashboard/dash1.svg',
          fit: BoxFit.fill,
        ),
      ),
      Container(
        height: 24.h,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textsax(
                text: 'num_of_joint_loan'.tr,
                fontSize: 18,
                color: Colorsax.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Textsax(
                    text: '$selfaCount ',
                    fontSize: 20,
                    color: Colorsax.white,
                    fontWeight: FontWeight.bold),
                Textsax(text: 'loan'.tr, fontSize: 20, color: Colorsax.white),
              ],
            )
          ],
        ),
      ),
    ],
  );
}

Widget dash2({required int selfaCount}) {
  return Stack(
    children: [
      SizedBox(
        height: 23.5.h,
        width: 43.5.w,
        child: SvgPicture.asset(
          'assets/images/dashboard/dash2.svg',
          fit: BoxFit.fill,
        ),
      ),
      Container(
        height: 23.5.h,
        width: 43.5.w,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Iconsax.more,
                  color: Colorsax.white,
                )
              ],
            ),
            Textsax(
                text: 'active_loan'.tr,
                fontSize: 16,
                color: Colorsax.white,
                fontWeight: FontWeight.bold),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Textsax(
                    text: '$selfaCount ',
                    fontSize: 16,
                    color: Colorsax.white,
                    fontWeight: FontWeight.bold),
                Textsax(text: 'loan'.tr, fontSize: 16, color: Colorsax.white),
              ],
            )
          ],
        ),
      ),
    ],
  );
}

Widget dash3({required int selfaCount}) {
  return Stack(
    children: [
      SizedBox(
        height: 23.5.h,
        width: 43.5.w,
        child: SvgPicture.asset(
          'assets/images/dashboard/dash3.svg',
          fit: BoxFit.fill,
        ),
      ),
      Container(
        height: 23.5.h,
        width: 43.5.w,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Iconsax.more,
                  color: Colorsax.white,
                )
              ],
            ),
            Textsax(
                text: 'inactive_loan'.tr,
                fontSize: 16,
                color: Colorsax.white,
                fontWeight: FontWeight.bold),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Textsax(
                    text: '$selfaCount ',
                    fontSize: 16,
                    color: Colorsax.white,
                    fontWeight: FontWeight.bold),
                Textsax(text: 'loan'.tr, fontSize: 16, color: Colorsax.white),
              ],
            )
          ],
        ),
      ),
    ],
  );
}

Widget dash4({required String selfaCount}) {
  return Stack(
    children: [
      SizedBox(
        width: 95.w,
        height: 14.h,
        child: SvgPicture.asset(
          'assets/images/dashboard/dash4.svg',
          fit: BoxFit.fill,
        ),
      ),
      Container(
        height: 14.h,
        width: 95.w,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textsax(
                text: 'monthly_payment'.tr,
                fontSize: 15,
                color: Colorsax.black,
                fontWeight: FontWeight.bold),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Textsax(
                    text: '$selfaCount',
                    fontSize: 19,
                    color: Colorsax.white,
                    fontWeight: FontWeight.bold),
                Textsax(
                    text: 'iqd'.tr,
                    fontSize: 19,
                    color: Colorsax.black,
                    fontWeight: FontWeight.bold),
              ],
            )
          ],
        ),
      ),
    ],
  );
}
