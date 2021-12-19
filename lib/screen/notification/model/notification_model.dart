import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

class MyNotification {
  String notification_title;
  IconData notification_icon;
  String notification_time;

  MyNotification({
    required this.notification_title,
    required this.notification_icon,
    required this.notification_time,
  });
}

List<MyNotification> notifications = [
  MyNotification(
      notification_title: 'باقي 5 ساعات على بدأ السلفة',
      notification_icon: Iconsax.timer,
      notification_time: 'قبل 5 دقائق'),
  MyNotification(
      notification_title: 'وصلت سلفتك للعدد المطلوب',
      notification_icon: Iconsax.tick_circle,
      notification_time: 'قبل 5 دقائق'),
];
