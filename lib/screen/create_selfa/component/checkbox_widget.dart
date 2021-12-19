import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

import 'controller/checkbox_controller.dart';

Widget checkBox(
    {required bool checked,
    required String title,
    required String description,
    required CheckController checkController}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    child: ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      leading: GetBuilder<CheckController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
                checked ? Iconsax.tick_circle4 : Icons.radio_button_unchecked,
                color: checked ? Colorsax.green : Colorsax.lightGrey),
          );
        },
      ),
      title: Textsax(text: title, fontSize: 13),
      subtitle: Container(
        padding: EdgeInsets.only(top: 1.h),
        width: 80.w,
        child: Text(
          description,
          style: GoogleFonts.cairo(fontSize: 10.sp),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          softWrap: true,
        ),
      ),
      onTap: () {
        checkController.check();
        checked = checkController.checked;
      },
    ),
  );
}
