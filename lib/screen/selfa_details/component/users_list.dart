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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Textsax(
                text: '${widget.index + 1}-',
                fontSize: 16,
                fontWeight: FontWeight.bold),
            SizedBox(
              width: 2.3.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textsax(text: widget.user.user_name, fontSize: 15),
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
                            color: Colorsax.green),
                      )
                    : Container(),
                widget.user.is_for_sell
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                        decoration: BoxDecoration(
                            color: Colorsax.insta1,
                            borderRadius: BorderRadius.circular(10)),
                        child: Textsax(
                            text: 'forsell'.tr,
                            fontSize: 11,
                            color: Colorsax.white),
                      )
                    : Container(),
              ],
            )
          ],
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
