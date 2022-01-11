import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

import 'component/selfa_card.dart';
import 'component/selfa_filter.dart';
import 'model/self_model.dart';

class SelfaFeedPage extends StatefulWidget {
  const SelfaFeedPage({Key? key}) : super(key: key);

  @override
  State<SelfaFeedPage> createState() => _SelfaFeedPageState();
}

class _SelfaFeedPageState extends State<SelfaFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color.main,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 1.h, right: 1.w),
          child: Textsax(
              text: 'loans'.tr, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: showSortDialog,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.5.w, vertical: 0.8.h),
                    decoration: BoxDecoration(
                        color: Get.theme.listTileTheme.tileColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Iconsax.arrow_swap,
                          size: 15.sp,
                          color: Colorsax.blue,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Textsax(
                            text: 'sort'.tr,
                            fontSize: 13.2,
                            color: Get.theme.iconTheme.color),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                GestureDetector(
                  onTap: showFilterDialog,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.5.w, vertical: 0.8.h),
                    decoration: BoxDecoration(
                        color: Get.theme.listTileTheme.tileColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Iconsax.filter,
                          size: 15.sp,
                          color: Colorsax.blue,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Textsax(
                            text: 'filter'.tr,
                            fontSize: 13.2,
                            color: Get.theme.iconTheme.color),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 1.h, left: 5.w, right: 5.w),
        width: 100.w,
        height: 100.h,
        child: RefreshIndicator(
          onRefresh: refresh,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (_context, index) {
              return SelfaCard(
                selfa: selfat[index],
              );
            },
            itemCount: selfat.length,
          ),
        ),
      ),
    );
  }

  Future<void> refresh() {
    return Future.delayed(const Duration(seconds: 2));
  }
}
