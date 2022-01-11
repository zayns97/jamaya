import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selfa/screen/selfa_feed/component/selfa_card.dart';
import 'package:selfa/screen/selfa_feed/model/self_model.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

class MySelfaList extends StatefulWidget {
  const MySelfaList({Key? key}) : super(key: key);

  @override
  State<MySelfaList> createState() => _MySelfaListState();
}

class _MySelfaListState extends State<MySelfaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.5.h),
                        child: Textsax(
                            text: 'my_loan'.tr,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 1.h),
                    width: 100.w,
                    height: 89.h,
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
                ],
              ),
            ),
            Positioned(
                top: 0.h,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 1.5.h, horizontal: 2.5.w),
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Get.theme.listTileTheme.tileColor),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 15.sp,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> refresh() {
    return Future.delayed(const Duration(seconds: 2));
  }
}
