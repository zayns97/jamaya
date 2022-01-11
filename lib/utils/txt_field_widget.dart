import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selfa/screen/registration/component/login_functions.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

Widget txtFormField(
    String hint,
    IconData prefixIcon,
    TextInputType textInputType,
    TextInputAction textInputAction,
    TextEditingController controller,
    String validation,
    BuildContext context,
    FocusNode focusNode,
    {bool onEditingComplete = false}) {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return validation;
      }
    },
    onEditingComplete: () {
      onEditingComplete ? submitFormOnLogin(context) : () {};
    },
    focusNode: focusNode,
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
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      errorMaxLines: 1,
      enabledBorder: OutlineInputBorder(
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
