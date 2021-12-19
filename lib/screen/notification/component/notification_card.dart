import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:selfa/screen/notification/model/notification_model.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({Key? key, required this.notification})
      : super(key: key);
  final MyNotification notification;
  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      child: ListTile(
        title: Textsax(
            text: widget.notification.notification_title,
            fontSize: 13,
            fontWeight: FontWeight.bold),
        subtitle:
            Textsax(text: widget.notification.notification_time, fontSize: 11),
        leading: Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
              color: Colorsax.lightBlue,
              borderRadius: BorderRadius.circular(30)),
          child: Icon(
            widget.notification.notification_icon,
            color: Colorsax.blue,
          ),
        ),
        trailing: box.read('lang') == 'العربية'
            ? Icon(
                Iconsax.arrow_left_24,
                color: Colorsax.blue,
              )
            : Icon(
                Iconsax.arrow_right_34,
                color: Colorsax.blue,
              ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: EdgeInsets.all(2.h),
      ),
    );
  }
}
