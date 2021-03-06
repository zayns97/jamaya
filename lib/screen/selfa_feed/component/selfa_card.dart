import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:selfa/screen/selfa_details/model/user_model.dart';
import 'package:selfa/screen/selfa_details/selfa_details.dart';
import 'package:selfa/screen/selfa_feed/model/self_model.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

class SelfaCard extends StatefulWidget {
  const SelfaCard({Key? key, required this.selfa}) : super(key: key);
  final Selfa selfa;

  @override
  _SelfaCardState createState() => _SelfaCardState();
}

class _SelfaCardState extends State<SelfaCard> {
  final box = GetStorage();
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: SelfaDetails(
                selfa: widget.selfa,
              ),
            ));
      },
      child: Stack(
        children: [
          Container(
            width: 100.w,
            height: 20.h,
            margin: EdgeInsets.symmetric(vertical: 1.2.h),
            padding: EdgeInsets.all(1.7.h),
            decoration: BoxDecoration(
              color: Get.theme.listTileTheme.tileColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textsax(
                            text: widget.selfa.selfa_amount,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                        Textsax(text: 'iqd'.tr, fontSize: 16),
                      ],
                    ),
                    Textsax(
                        text: widget.selfa.privacy.tr,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colorsax.blue)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  widget.selfa.selfa_description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.cairo(
                    fontSize: 9.8.sp,
                    // color: color.cardDescription,
                  ),
                ),
              ],
            ),
          ),
          box.read('lang') == 'English'
              ? Positioned(
                  bottom: 2.55.w,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: Colorsax.lightBlue,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    height: 5.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Textsax(
                            text: 'share_amount'.tr,
                            fontSize: 10.5,
                            color: Colorsax.black,
                            fontWeight: FontWeight.bold),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Textsax(
                                text: widget.selfa.share_amount,
                                color: Colorsax.black,
                                fontSize: 11),
                            Textsax(
                                text: 'iqd'.tr,
                                color: Colorsax.black,
                                fontSize: 11),
                          ],
                        ),
                      ],
                    ),
                  ))
              : Positioned(
                  bottom: 2.55.w,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: Colorsax.lightGreen,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    height: 5.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Textsax(
                            text: 'share_amount'.tr,
                            fontSize: 10.5,
                            color: Colorsax.black,
                            fontWeight: FontWeight.bold),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Textsax(
                                text: widget.selfa.share_amount,
                                color: Colorsax.black,
                                fontSize: 11),
                            Textsax(
                                text: 'iqd'.tr,
                                color: Colorsax.black,
                                fontSize: 11),
                          ],
                        ),
                      ],
                    ),
                  )),
          box.read('lang') == 'English'
              ? Positioned(
                  bottom: 2.2.h,
                  left: 3.w,
                  child: Row(
                    children: users.map((i) {
                      x++;
                      return x < 5
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 0.75.w),
                              width: 5.w,
                              height: 5.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colorsax.lightBlue),
                              child: Center(
                                  child: Icon(
                                Iconsax.user,
                                color: Colorsax.blue,
                                size: 4.w,
                              )),
                            )
                          : Container(
                              child: Textsax(
                                  text: '+${x - 4}',
                                  fontSize: 13,
                                  height: 2,
                                  fontWeight: FontWeight.bold),
                            );
                    }).toList(),
                  ))
              : Positioned(
                  bottom: 2.2.h,
                  right: 3.w,
                  child: Row(
                    children: users.map((i) {
                      x++;
                      return x < 5
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 0.75.w),
                              width: 5.w,
                              height: 5.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colorsax.lightBlue),
                              child: Center(
                                  child: Icon(
                                Iconsax.user,
                                color: Colorsax.blue,
                                size: 4.w,
                              )),
                            )
                          : Container(
                              child: Textsax(
                                  text: '+${x - 4}',
                                  fontSize: 13,
                                  height: 2,
                                  fontWeight: FontWeight.bold),
                            );
                    }).toList(),
                  ))
        ],
      ),
    );
  }
}
