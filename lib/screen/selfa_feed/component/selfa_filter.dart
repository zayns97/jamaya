import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

Widget SortTab(String title, IconData icon) {
  return QudsPopupButton(
      // backgroundColor: Colors.red,

      tooltip: 'sort'.tr,
      items: getSortItems(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.w),
        padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.8.h),
        decoration: BoxDecoration(
            color: Get.theme.listTileTheme.tileColor,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Icon(
              icon,
              size: 15.sp,
              color: Colorsax.blue,
            ),
            SizedBox(
              width: 1.w,
            ),
            Textsax(
                text: title.tr,
                fontSize: 13.2,
                color: Get.theme.iconTheme.color),
          ],
        ),
      ));
}

Widget FilterTab(String title, IconData icon) {
  return QudsPopupButton(
      // backgroundColor: Colors.red,
      tooltip: 'filter'.tr,
      items: getFilterItems(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.8.h),
        decoration: BoxDecoration(
            color: Get.theme.listTileTheme.tileColor,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 15.sp,
              color: Colorsax.blue,
            ),
            SizedBox(
              width: 1.w,
            ),
            Textsax(
                text: title.tr,
                fontSize: 13.2,
                color: Get.theme.iconTheme.color),
          ],
        ),
      ));
}

List<QudsPopupMenuBase> getSortItems() {
  return [
    QudsPopupMenuWidget(builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Get.theme.canvasColor,
        ),
        child: ListTile(
          title: Textsax(
              text: 'sortby'.tr,
              fontSize: 11,
              textAlign: TextAlign.center,
              color: Get.theme.listTileTheme.textColor),
        ),
      );
    }),
    QudsPopupMenuDivider(),
    QudsPopupMenuItem(
        title: Textsax(
            text: 'loanAmount'.tr, fontSize: 11, textAlign: TextAlign.center),
        onPressed: () {}),
    QudsPopupMenuDivider(),
    QudsPopupMenuItem(
        title: Textsax(
            text: 'shareAmount'.tr, fontSize: 11, textAlign: TextAlign.center),
        onPressed: () {}),
    QudsPopupMenuDivider(),
    QudsPopupMenuWidget(builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Get.theme.canvasColor,
        ),
        child: ListTile(
          title: Textsax(
            text: 'sortby'.tr,
            fontSize: 11,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }),
    QudsPopupMenuDivider(),
    QudsPopupMenuItem(
        title: Textsax(
            text: 'ascending'.tr, fontSize: 11, textAlign: TextAlign.center),
        onPressed: () {}),
    QudsPopupMenuDivider(),
    QudsPopupMenuItem(
        title: Textsax(
            text: 'descending'.tr, fontSize: 11, textAlign: TextAlign.center),
        onPressed: () {}),
  ];
}

List<QudsPopupMenuBase> getFilterItems() {
  return [
    QudsPopupMenuWidget(builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            color: Get.theme.canvasColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: ListTile(
          title: Textsax(
            text: 'filtering'.tr,
            fontSize: 11,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }),
    QudsPopupMenuDivider(),
    QudsPopupMenuWidget(builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(3.w),
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textsax(text: 'loanAmount'.tr, fontSize: 11),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Textsax(text: 'from'.tr, fontSize: 11),
                SizedBox(
                    width: 14.w,
                    height: 4.h,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.cairo(
                        fontSize: 13.sp,
                      ),
                      decoration: InputDecoration(
                        filled: true,
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
                Textsax(text: '-', fontSize: 11),
                Textsax(text: 'to'.tr, fontSize: 11),
                SizedBox(
                    width: 14.w,
                    height: 4.h,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.cairo(
                        fontSize: 13.sp,
                      ),
                      decoration: InputDecoration(
                        filled: true,
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
          ],
        ),
      );
    }),
    QudsPopupMenuDivider(),
    QudsPopupMenuWidget(builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(3.w),
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textsax(text: 'shareAmount'.tr, fontSize: 11),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Textsax(text: 'from'.tr, fontSize: 11),
                SizedBox(
                    width: 14.w,
                    height: 4.h,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.cairo(
                        fontSize: 13.sp,
                      ),
                      decoration: InputDecoration(
                        filled: true,
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
                Textsax(text: '-', fontSize: 11),
                Textsax(text: 'to'.tr, fontSize: 11),
                SizedBox(
                    width: 14.w,
                    height: 4.h,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.cairo(
                        fontSize: 13.sp,
                      ),
                      decoration: InputDecoration(
                        filled: true,
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
          ],
        ),
      );
    }),
    QudsPopupMenuWidget(builder: (BuildContext context) {
      return SizedBox(
        width: 100.w,
        height: 5.h,
        child: MaterialButton(
          onPressed: () {},
          elevation: 0,
          color: Colorsax.blue,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Textsax(
                text: 'filter'.tr,
                fontSize: 14,
                color: Colorsax.white,
                fontWeight: FontWeight.bold),
          ]),
        ),
      );
    }),
  ];
}
