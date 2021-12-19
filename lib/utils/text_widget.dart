import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget Textsax({
  TextAlign textAlign = TextAlign.start,
  FontWeight fontWeight = FontWeight.w500,
  TextDirection? textDirection,
  double height = 1,
  int maxChars = 1000,
  required String text,
  required double fontSize,
  Color? color,
}) {
  return Text(text.length > maxChars ? text.substring(0, maxChars) : text,
      textAlign: textAlign,
      textDirection: textDirection,
      style: GoogleFonts.cairo(
        fontSize: fontSize.sp,
        height: height,
        color: color,
        fontWeight: fontWeight,
      ));
}
