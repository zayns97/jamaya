import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

import 'component/dash_cards.dart';
import 'component/qr_scanner.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Image.asset(
            'assets/images/logo.png',
            width: 16.w,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const QRViewer(),
              ));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colorsax.lightBlue),
              child: Icon(
                Icons.qr_code_scanner,
                color: Colorsax.blue,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 3.5.h, horizontal: 4.w),
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Textsax(text: 'hello'.tr, fontSize: 20),
                    Textsax(
                        text: 'احمد محمد',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                dash1(selfaCount: 2),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dash2(selfaCount: 1),
                    dash3(selfaCount: 1),
                  ],
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                dash4(selfaCount: '300,000'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
