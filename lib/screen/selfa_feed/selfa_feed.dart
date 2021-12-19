import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 1.h, right: 1.w),
          child: Textsax(
              text: 'loans'.tr, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SortTab('sort'.tr, Iconsax.sort),
              FilterTab('filter'.tr, Iconsax.filter),
            ],
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
