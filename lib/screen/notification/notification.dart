import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

import 'component/notification_card.dart';
import 'model/notification_model.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 28.w,
                    margin: const EdgeInsets.all(15),
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                    decoration: BoxDecoration(
                        color: context.theme.listTileTheme.tileColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Textsax(
                        text: 'notification'.tr,
                        fontSize: 13.5,
                        textAlign: TextAlign.center))
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (_context, index) {
                  return NotificationCard(
                    notification: notifications[index],
                  );
                },
                itemCount: notifications.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
