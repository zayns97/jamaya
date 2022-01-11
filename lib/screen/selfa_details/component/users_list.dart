import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:selfa/screen/selfa_details/model/user_model.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

class UserListCard extends StatefulWidget {
  UserListCard({Key? key, required this.user, required this.index})
      : super(key: key);
  final User user;
  int index;
  @override
  _UserListCardState createState() => _UserListCardState();
}

class _UserListCardState extends State<UserListCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Textsax(
                text: '${widget.index + 1}-',
                fontSize: 16,
                color: Colorsax.blue,
                fontWeight: FontWeight.bold),
            SizedBox(
              width: 2.4.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.5.h,
                ),
                Textsax(
                    text: widget.user.user_name,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    Textsax(
                        text: '${widget.user.share_amount} ',
                        fontSize: 13,
                        color: Colorsax.grey),
                    Textsax(
                        text: 'share'.tr, fontSize: 13, color: Colorsax.grey),
                  ],
                )
              ],
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                widget.user.is_reserved
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colorsax.lightGreen,
                            borderRadius: BorderRadius.circular(10)),
                        child: Textsax(
                            text: 'reserve'.tr,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colorsax.green),
                      )
                    : Container(),
                widget.user.is_for_sell
                    ? SizedBox(
                        width: 1.5.w,
                      )
                    : Container(),
                widget.user.is_for_sell
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        // margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                        decoration: BoxDecoration(
                            color: Colorsax.lightGrey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Textsax(
                            text: 'forsell'.tr,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colorsax.darkGrey),
                      )
                    : Container(),
              ],
            )
          ],
        ),
        SizedBox(
          height: 1.h,
        )
      ],
    );
  }
}
