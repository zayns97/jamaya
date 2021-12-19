import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

Widget txtFormField(
    String hint,
    IconData prefixIcon,
    TextInputType textInputType,
    TextInputAction textInputAction,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    textInputAction: textInputAction,
    keyboardType: textInputType,
    style: GoogleFonts.cairo(
      fontSize: 13.sp,
    ),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.cairo(
        fontSize: 13.sp,
      ),
      prefixIcon: Icon(
        prefixIcon,
        color: Colorsax.lightBlue,
      ),
      filled: true,
      fillColor: Get.theme.listTileTheme.tileColor,
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
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    ),
  );
}
