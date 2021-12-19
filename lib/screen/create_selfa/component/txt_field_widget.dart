import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/colors.dart';

Widget textarea(String hint, IconData prefixIcon, TextInputType textInputType,
    BuildContext context, TextEditingController controller) {
  return Container(
    padding: EdgeInsets.only(bottom: 2.h),
    child: TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      minLines: 3,
      style: GoogleFonts.cairo(
        fontSize: 13.sp,
      ),
      textInputAction: TextInputAction.newline,
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 40),
        hintText: hint,
        hintStyle: GoogleFonts.cairo(
          fontSize: 13.sp,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Icon(
            prefixIcon,
            color: Colorsax.lightBlue,
          ),
        ),
        filled: true,
        fillColor: context.theme.listTileTheme.tileColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    ),
  );
}
