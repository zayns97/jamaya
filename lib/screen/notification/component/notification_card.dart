import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:selfa/screen/notification/model/notification_model.dart';
import 'package:selfa/screen/registration/login.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/tiles.dart';
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
      padding: EdgeInsets.only(top: 1.5.h, bottom: 1.h),
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      child: Tilesax(
          context: context,
          title: widget.notification.notification_title,
          subtitle: widget.notification.notification_time,
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
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
          ),
          navigateTo: LoginPage()),
    );
  }
}
