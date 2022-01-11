import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import 'screen/create_selfa/create_selfa.dart';
import 'screen/dashboard/dashboard.dart';
import 'screen/notification/notification.dart';
import 'screen/profile/profile_tiles.dart';
import 'screen/selfa_feed/selfa_feed.dart';
import 'utils/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(
      actionButton: CurvedActionBar(
          onTab: (value) {},
          activeIcon: Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
                color: Colorsax.blue,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: Get.theme.dividerColor,
                )),
            child: Icon(
              Iconsax.add,
              size: 30,
              color: Colorsax.white,
            ),
          ),
          inActiveIcon: Container(
            padding: const EdgeInsets.all(17),
            decoration:
                BoxDecoration(color: Colorsax.blue, shape: BoxShape.circle),
            child: Icon(
              Iconsax.add,
              size: 30,
              color: Colorsax.white,
            ),
          )),
      activeColor: Colors.blue,
      navBarBackgroundColor: context.theme.listTileTheme.tileColor,
      appBarItems: [
        FABBottomAppBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Icon(Iconsax.home_2, size: 30, color: Colorsax.blue),
            ),
            inActiveIcon: Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: const Icon(
                Iconsax.home_2,
                size: 30,
              ),
            ),
            text: ''),
        FABBottomAppBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Icon(
                Iconsax.empty_wallet,
                size: 30,
                color: Colorsax.blue,
              ),
            ),
            inActiveIcon: Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: const Icon(
                Iconsax.empty_wallet,
                size: 30,
              ),
            ),
            text: ''),
        FABBottomAppBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Icon(
                Iconsax.notification_bing,
                size: 30,
                color: Colorsax.blue,
              ),
            ),
            inActiveIcon: Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: const Icon(
                Iconsax.notification_bing,
                size: 30,
              ),
            ),
            text: ''),
        FABBottomAppBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Icon(
                Iconsax.frame_1,
                size: 30,
                color: Colorsax.blue,
              ),
            ),
            inActiveIcon: Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: const Icon(
                Iconsax.frame_1,
                size: 30,
              ),
            ),
            text: ''),
      ],
      bodyItems: const [
        DashBoardPage(),
        SelfaFeedPage(),
        NotificationPage(),
        ProfileTilesPage(),
      ],
      actionBarView: const CreateSelfa(),
    );
  }
}
